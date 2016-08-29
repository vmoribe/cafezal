class Analise < ActiveRecord::Base
  belongs_to :user
  belongs_to :fazenda
  belongs_to :talhao

validates_presence_of :fazenda_id, :talhao_id, :situacao, :profundidade, :ano, :ph, :potassio_k, :fosforo_p, :sodio_na, :calcio_ca, :magnesio_mg, :aluminio_al, :h_al, :mat_organica, :p_rem, :zinco_zn, :ferro_fe, :manganes_mn, :cobre_cu, :boro_b, :enxofre_s

#Relações



#Gessagem
  def gessoTotalCorrigido(correcaoGesso,areaTalhao)
    correcaoGesso * areaTalhao   
  end

  def correcaoGesso(necessidadeGessagem,areaAplicacao,profundidade)
    necessidadeGessagem * (areaAplicacao/100) * (profundidade/20)
  end

  def calculoCaGessagem(p_rem)
    if calcio_ca <= 0.4
     315.8 - ((25.5066*(p_rem)**0.5) - (5.70675*(p_rem)) + (0.485335*((p_rem)**1.5)))
    elsif aluminio_al > 0.5
     315.8 - ((25.5066*(p_rem)**0.5) - (5.70675*(p_rem)) + (0.485335*((p_rem)**1.5)))
    elsif saturacaoAluminio > 30
     315.8 - ((25.5066*(p_rem)**0.5) - (5.70675*(p_rem)) + (0.485335*((p_rem)**1.5)))       
    else
    0      
    end
  end

  def necessidadeGessagem(caGessagem,teorCalcio)
    caGessagem / (10*teorCalcio)
  end

  def saturacaoAluminio
    (100 * aluminio_al) / ctcEfetiva
  end

#Calagem

  def ctcEfetiva
    somaDasBases + aluminio_al
  end

  def proporcaoCaMg
    calcio_ca / magnesio_mg
  end

  def kcmolcConvertido
    potassio_k / 390
  end

  def somaDasBases
    kcmolcConvertido + calcio_ca + magnesio_mg
  end

  def ctcApH7
    somaDasBases + h_al
  end

  def saturacaoBase
    (somaDasBases / ctcApH7) * 100
  end

  def necessidadeCalagem
    if (((60 - saturacaoBase) * ctcApH7) / 100) < 0
    0
    else
    ((60 - saturacaoBase) * ctcApH7) / 100
    end 
  end

  def necCalagemCompl
    @volumeCova = 64
    if situacao == "Plantio"
      ((necessidadeCalagem * @volumeCova)/2)*2.5
    else
    0
    end
  end

  def calculoCorrecao(profundidade, areaAplicacao, prnt)
  (profundidade / 20)*(areaAplicacao / 100)*(100/prnt)
  end

  def metrosLineares
    (10000/talhao.esp_ruas)
  end

  def calagemComplementar
    (necCalagemCompl * metrosLineares)/1000000 
  end

  def necCalagemCompAreaTotal
    calagemComplementar * talhao.area
  end

  def nctotalcomarea
    talhao.area * (necessidadeCalagem)
  end

  def ncTotalComAreaCorrigida(profundidade, areaAplicacao, prnt)
    if situacao == "Plantio"
      nctotalcomarea * ((profundidade / 20)*(100/prnt))
    else
      nctotalcomarea * ((profundidade / 20)*(areaAplicacao / 100)*(100/prnt))
    end
  end

  def somaCalcario(profundidade, areaAplicacao, prnt)
    if situacao == "Plantio"
      (nctotalcomarea * ((profundidade / 20)*(100/prnt))) + necCalagemCompAreaTotal
    else
      (nctotalcomarea * ((profundidade / 20)*(areaAplicacao / 100)*(100/prnt))) + necCalagemCompAreaTotal
    end
  end

  def ncporha
    nctotalcomarea / talhao.area
  end

#Fertilidade - Micronutrientes

  def necBoro #Extrator Água quente
    case boro_b
    when 0 .. 0.2
      3
    when 0.21 .. 0.4
      2
    when 0.41 .. 0.6
      1
    when 0.61 .. 1000
      0
    end
  end

  def necCobre #Extrator Mechlich-1
    case cobre_cu
    when 0 .. 0.5
      3
    when 0.51 .. 1.0
      2
    when 1.01 .. 1.5
      1
    when 1.51 .. 1000
      0
    end
  end

  def necManganes #Extrator Mechlich-1
    case manganes_mn
    when 0 .. 5.0
      15
    when 5.01 .. 10.0
      10
    when 10.01 .. 15.0
      5
    when 15.01 .. 1000
      0
    end
  end

  def necZinco #Extrator Mechlich-1
    case zinco_zn
    when 0 .. 2.0
      6
    when 2.01 .. 4.0
      4
    when 4.01 .. 6.0
      2
    when 6.01 .. 1000
      0
    end
  end


#Fertilidade - Plantio

  def necNplantio
    5  
  end

  def necNplantioemMetroLinear
    necNplantio / talhao.esp_plantas
  end

  def necNplantioemKgha
    (necNplantioemMetroLinear * metrosLineares)/1000
  end

  def necNPlantioAplicacao # kg/aplicação
    (necNplantioemKgha * talhao.area)
  end

  def necNplantioTotal(parcelamento)
    necNPlantioAplicacao * parcelamento
  end

  def necP2o5plantioemMetroLinear
  necP2o5plantio / talhao.esp_plantas   
  end

  def necP2o5plantioemKgha
    (necP2o5plantioemMetroLinear * metrosLineares)/1000
  end

  def necP2o5plantioTotal
    necP2o5plantioemKgha * talhao.area
  end

  def necP2o5plantio 
    @muitoBaixo = 80
    @baixo = 65
    @medio = 50
    @bom = 35
    @muitoBom = 20
    case p_rem
    when 0 .. 4
      case fosforo_p
      when 0 .. 9
        @muitoBaixo
      when 9.01 .. 13
        @baixo
      when 13.01 .. 18
        @medio
      when 18.01 .. 24
        @bom
      when 24.01 .. 1000
        @muitoBom                
      end
    when 4.01 .. 10
      case fosforo_p
      when 0 .. 12
        @muitoBaixo
      when 12.01 .. 18
        @baixo
      when 18.01 .. 25
        @medio
      when 25.01 .. 37.5
        @bom
      when 37.51 .. 1000
        @muitoBom                
      end
      when 10.01 .. 19
      case fosforo_p
      when 0 .. 18
        @muitoBaixo
      when 18.01 .. 25
        @baixo
      when 25.01 .. 34.2
        @medio
      when 34.21 .. 52.5
        @bom
      when 52.51 .. 1000
        @muitoBom                        
      end 
      when 19.01 .. 30
      case fosforo_p
      when 0 .. 24
        @muitoBaixo
      when 24.01 .. 34.2
        @baixo
      when 34.21 .. 47.4
        @medio
      when 47.41 .. 72
        @bom
      when 72.01 .. 1000
        @muitoBom                        
      end
      when 30.01 .. 44
      case fosforo_p
      when 0 .. 33
        @muitoBaixo
      when 33.01 .. 47.4
        @baixo
      when 47.41 .. 65.4
        @medio
      when 65.41 .. 99
        @bom
      when 99.01 .. 1000
        @muitoBom                        
      end 
      when 44.01 .. 60
      case fosforo_p
      when 0 .. 45
        @muitoBaixo
      when 45.01 .. 65.4
        @baixo
      when 65.41 .. 90
        @medio
      when 90.01 .. 135
        @bom
      when 135.01 .. 1000
        @muitoBom                        
      end     
    end  
  end


  def necK2oplantio
    case potassio_k
    when 0 .. 60
      30
    when 60.01 .. 120
      20
    when 120.01 .. 200
      10
    when 200.01 .. 1000
      0
    end
  end

  def necK2oplantioemMetroLinear
  necK2oplantio / talhao.esp_plantas   
  end

  def necK2oplantioemKgha
    (necK2oplantioemMetroLinear * metrosLineares)/1000
  end

  def necK2oPlantioAplicacaoHa(parcelamento) # kg/aplicação
    (necK2oplantioemKgha / parcelamento)
  end

  def necK2oplantioAreaTotal
    (necK2oplantioemKgha)/3 * talhao.area
  end

  def necK2oPlantioTotal(parcelamento)
    necK2oplantioAreaTotal * parcelamento
  end

#Fertilidade - 1° Ano

  def necN1ano
    10  
  end

  def necN1anoemMetroLinear
    necN1ano / talhao.esp_plantas
  end

  def necN1anoemKgha
    (necN1anoemMetroLinear * metrosLineares)/1000
  end

  def necN1anoTotal
    necN1anoemKgha * talhao.area
  end

  def necN1anoTotalParcelamento(parcelamento)
    necN1anoTotal * parcelamento
  end

  def necK2o1ano
    case potassio_k
    when 0 .. 60
      40
    when 60.01 .. 120
      20
    when 120.01 .. 200
      10
    when 200.01 .. 1000
      0
    end
  end

  def necK2o1anoemMetroLinear
  necK2o1ano / talhao.esp_plantas   
  end

  def necK2o1anoemKgha
    (necK2o1anoemMetroLinear * metrosLineares)/1000
  end

  def necK2o1anoTotal
    necK2o1anoemKgha * talhao.area
  end

  #Fertilidade - 2° Ano

  def necN2ano
    20  
  end

  def necN2anoemMetroLinear
    necN2ano / talhao.esp_plantas
  end

  def necN2anoemKgha
    (necN2anoemMetroLinear * metrosLineares)/1000
  end

  def necN2anoTotal
    necN2anoemKgha * talhao.area
  end

  def necN2anoTotalParcelamento(parcelamento)
    necN2anoTotal * parcelamento
  end
  
  def necK2o2ano
    case potassio_k
    when 0 .. 60
      60
    when 60.01 .. 120
      40
    when 120.01 .. 200
      20
    when 200.01 .. 1000
      0
    end
  end

  def necK2o2anoemMetroLinear
  necK2o2ano / talhao.esp_plantas   
  end

  def necK2o2anoemKgha
    (necK2o2anoemMetroLinear * metrosLineares)/1000
  end

  def necK2o2anoTotal
    necK2o2anoemKgha * talhao.area
  end

  #Fertilidade - Producao

  def necNProducaoKgha(producao_esperada) #em Kg/ha/ano
    case producao_esperada
      when "<20"
        200
      when "21 - 30"
        250
      when "31 - 40"
        300
      when "41 - 50"
        350
      when "51 - 60"
        400
      when ">60"
        450
    end  
  end

  def necNProducaoemMetroLinear(producao_esperada) #gramas/metro linear
    (necNProducaoKgha(producao_esperada) * 1000) / metrosLineares
  end

  def necNProducaoAplicacao(producao_esperada,parcelamento) # kg/aplicação
    (necNProducaoKgha(producao_esperada) / parcelamento)
  end

  def necNProducaoTotal(producao_esperada) #kg/ talhao
    necNProducaoKgha(producao_esperada) * talhao.area
  end

  def necP2o5ProducaoemMetroLinear(producao_esperada) # gramas/metro linear
  (necP2o5ProducaoKgha(producao_esperada) * 1000) / metrosLineares   
  end

  def necP2o5ProducaoTotal(producao_esperada) #kg/talhão
     necP2o5ProducaoKgha(producao_esperada) * talhao.area
  end

  def necP2o5ProducaoKgha(producao_esperada) #kg/ha/ano
    @muitoBaixo = 
    case producao_esperada
      when "<20"
        30
      when "21 - 30"
        40
      when "31 - 40"
        50
      when "41 - 50"
        60
      when "51 - 60"
        70
      when ">60"
        80
    end  
    @baixo = 
    case producao_esperada
      when "<20"
        20
      when "21 - 30"
        30
      when "31 - 40"
        40
      when "41 - 50"
        50
      when "51 - 60"
        55
      when ">60"
        60
    end 
    @medio = 
    case producao_esperada
      when "<20"
        10
      when "21 - 30"
        20
      when "31 - 40"
        25
      when "41 - 50"
        30
      when "51 - 60"
        35
      when ">60"
        40
    end 
    @bom = 
    case producao_esperada
      when "<20"
        0
      when "21 - 30"
        0
      when "31 - 40"
        0
      when "41 - 50"
        15
      when "51 - 60"
        18
      when ">60"
        20
    end 
    @muitoBom = 0

    case p_rem
    when 0 .. 4
      case fosforo_p
      when 0 .. 2.3
        @muitoBaixo
      when 2.31 .. 3.2
        @baixo
      when 3.21 .. 4.5
        @medio
      when 4.51 .. 6.8
        @bom
      when 6.81 .. 1000
        @muitoBom                
      end
    when 4.01 .. 10
      case fosforo_p
      when 0 .. 3
        @muitoBaixo
      when 3.01 .. 4.5
        @baixo
      when 4.51 .. 6.2
        @medio
      when 6.21 .. 9.4
        @bom
      when 9.41 .. 1000
        @muitoBom                
      end
      when 10.01 .. 19
      case fosforo_p
      when 0 .. 4.5
        @muitoBaixo
      when 4.51 .. 6.2
        @baixo
      when 6.21 .. 8.5
        @medio
      when 8.51 .. 13.1
        @bom
      when 13.11 .. 1000
        @muitoBom                        
      end 
      when 19.01 .. 30
      case fosforo_p
      when 0 .. 6
        @muitoBaixo
      when 6.01 .. 8.5
        @baixo
      when 8.51 .. 11.9
        @medio
      when 11.91 .. 18
        @bom
      when 18.01 .. 1000
        @muitoBom                        
      end
      when 30.01 .. 44
      case fosforo_p
      when 0 .. 8.3
        @muitoBaixo
      when 8.31 .. 11.9
        @baixo
      when 11.91 .. 16.4
        @medio
      when 16.41 .. 24.8
        @bom
      when 24.81 .. 1000
        @muitoBom                        
      end 
      when 44.01 .. 60
      case fosforo_p
      when 0 .. 11.3
        @muitoBaixo
      when 11.31 .. 16.4
        @baixo
      when 16.41 .. 22.5
        @medio
      when 22.51 .. 33.8
        @bom
      when 33.81 .. 1000
        @muitoBom                        
      end     
    end  
  end


  def necK2oProducaoKgha(producao_esperada) #kg/ha/ano
    @baixo = 
    case producao_esperada
      when "<20"
        200
      when "21 - 30"
        250
      when "31 - 40"
        300
      when "41 - 50"
        350
      when "51 - 60"
        400
      when ">60"
        450
    end  
    @medio = 
    case producao_esperada
      when "<20"
        150
      when "21 - 30"
        190
      when "31 - 40"
        225
      when "41 - 50"
        260
      when "51 - 60"
        300
      when ">60"
        340
    end 
    @bom = 
    case producao_esperada
      when "<20"
        100
      when "21 - 30"
        125
      when "31 - 40"
        150
      when "41 - 50"
        175
      when "51 - 60"
        200
      when ">60"
        225
    end 
    @muitoBom = 
    case producao_esperada
      when "<20"
        0
      when "21 - 30"
        0
      when "31 - 40"
        0
      when "41 - 50"
        50
      when "51 - 60"
        75
      when ">60"
        100
    end

    case potassio_k
    when 0 .. 60
      @baixo
    when 60.01 .. 120
      @medio
    when 120.01 .. 200
      @bom
    when 200.01 .. 1000
      @muitoBom
    end
  end

  def necK2oProducaoemMetroLinear(producao_esperada) #gramas/metro linear
    (necK2oProducaoKgha(producao_esperada) * 1000) / metrosLineares
  end

  def necK2oProducaoAplicacao(producao_esperada,parcelamento) # kg/aplicação
    (necK2oProducaoKgha(producao_esperada) / parcelamento)
  end

  def necK2oProducaoTotal(producao_esperada) #kg/ talhao
    necK2oProducaoKgha(producao_esperada) * talhao.area
  end


end
