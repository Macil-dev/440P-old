module Data.P440.XML.Instances.ComplexTypes where

import Data.P440.XML.XML

import Data.P440.Domain.ComplexTypes

import Data.P440.XML.Instances.SimpleTypes

-- Сложные типы из раздела 2.15

-- Сведения о банке (филиале) БанкТип

банк name (Банк регНом номФил бикБанк наимБанк иннБанк кппБанк) =
    complex_ "Банк"
             ["РегНом" =: регНом
             ,"НомФил" =: номФил
             ,"БИК" =: бикБанк
             ,"НаимБанк" =: наимБанк
             ,"ИННБанк" =: иннБанк
             ,"КППБанк" =: кппБанк]

-- Сведения об учреждении Банка России УБРТип

убр name (УБР бикУБР наимУБР иннбр кппубр) =
    complex_ name
            ["БИК"     =: бикУБР
            ,"НаимУБР" =: наимУБР
            ,"ИННБР"   =: иннбр
            ,"КППУБР"  =: кппубр]

-- Сведения о налоговом органе СвНОТип

свНО name (СвНО кодНО наимНО) =
    complex_ name
             ["КодНО"  =: кодНО
             ,"НаимНО" =: наимНО]

-- Руководитель (заместитель) НО РукНОТип

рукНО name (РукНО классЧин фиоРукНО) =
    complex name
            ["КлассЧин" =: классЧин]
            [Sequence [фио "ФИО" фиоРукНО]]

-- Представитель КО/УБР

предБ name (ПредБ должностьПредБ фиоПредБ) =
    complex "ПредБ"
            ["Должность" =: должностьПредБ]
            [Sequence [фио "ФИО" фиоПредБ]]

-- Плательщик - организация ПлЮЛТип

плЮЛ name (ПлЮЛ иннЮЛ кппЮЛ наимЮЛ) =
    complex_ name
             ["ИННЮЛ"  =: иннЮЛ
             ,"КПП"    =: кппЮЛ
             ,"НаимЮЛ" =: наимЮЛ]

-- Плательщик - ИП/Физ. лицо/Нотариус/Адвокат ПлФЛ

плФЛ name (ПлФЛ иннФЛ фиоФЛ) =
    complex  name
             ["ИННФЛ" =: иннФЛ]
             [(Sequence [фио "ФИО" фиоФЛ])]

-- ФИО ФИОТип

фио name (ФИО фамилия имя отчество) =
    complex_ name
             ["Фамилия"  =: фамилия
             ,"Имя"      =: имя
             ,"Отчество" =: отчество]

-- Адрес в Российской Федерации АдрРФТип

instance ToNode АдрРФ where
    toNode (АдрРФ индекс кодРегион район город
                  населПункт улица дом корпус
                  кварт) =
        complex_ "АдрРФ"
                 ["Индекс"     =: индекс
                 ,"КодРегион"  =: кодРегион
                 ,"Район"      =: район
                 ,"Город"      =: город
                 ,"НаселПункт" =: населПункт
                 ,"Улица"      =: улица
                 ,"Дом"        =: дом
                 ,"Корпус"     =: корпус
                 ,"Кварт"      =: кварт]
