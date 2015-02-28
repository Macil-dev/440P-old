{-#LANGUAGE OverloadedStrings#-}
module Data.P440.XML.Instances.ZSV where

import qualified Data.P440.Domain.ZSV as ZSV
import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes

import Data.P440.XML.XML
import qualified Data.P440.XML.Instances.SimpleTypes
import qualified Data.P440.XML.Instances.ComplexTypes as C
import qualified Data.P440.XML.Instances.ComplexTypesZS as C

instance ToNode ZSV.Файл where
    toNode (ZSV.Файл идЭС версПрог телОтпр
                     должнОтпр фамОтпр запросВыпис) =
        complex "Файл"
                ["ИдЭС"      =: идЭС
                ,"ВерсПрог"  =: версПрог
                ,"ТелОтпр"   =: телОтпр
                ,"ДолжнОтпр" =: должнОтпр
                ,"ФамОтпр"   =: фамОтпр]
                [Single запросВыпис]

instance ToNode ZSV.ЗапросВыпис where
    toNode (ZSV.ЗапросВыпис номЗапр стНКРФ видЗапр основЗапр типЗапр
                            признЗапр датаПодп свНО' свПл
                            банкИлиУБР поУказаннымИлиПоВсем руководитель) =
        complex "ЗапросВыпис"
                ["НомЗапр"   =: номЗапр
                ,"СтНКРФ"    =: стНКРФ
                ,"ВидЗапр"   =: видЗапр
                ,"ОсновЗапр" =: основЗапр
                ,"ТипЗапр"   =: типЗапр
                ,"ПризнЗапр" =: признЗапр
                ,"ДатаПодп"  =: датаПодп]
                [Single $ C.свНО "СвНО" свНО'
                ,Single свПл
                ,Single банкИлиУБР
                ,Single поУказаннымИлиПоВсем
                ,Single $ C.рукНО "Руководитель" руководитель]

instance ToNode ZSV.ПоУказаннмыИлиПоВсем where
    toNode (ZSV.ПоУказанным счетИлиКЭСП) =
        complex "ПоУказанным"
                []
                [Sequence счетИлиКЭСП]
    toNode (ZSV.ПоВсем наДатуИлиЗаПериод) =
        complex "ПоВсем"
                []
                [Single наДатуИлиЗаПериод]

instance ToSequence ZSV.СчетИлиКЭСП where
    toSequence (ZSV.Счет' счет) =
        toSequence счет
    toSequence (ZSV.КЭСП' кэсп) =
        toSequence кэсп

instance ToNode ZSV.Счет where
    toNode (ZSV.Счет номСч датаНач датаКон) =
        complex_ "Счет"
                 ["НомСч"   =: номСч
                 ,"ДатаНач" =: датаНач
                 ,"ДатаКон" =: датаКон]

instance ToNode ZSV.КЭСП where
    toNode (ZSV.КЭСП идКэсп датаНач датаКон) =
        complex_ "Счет"
                 ["ИдКЭСП"  =: идКэсп
                 ,"ДатаНач" =: датаНач
                 ,"ДатаКон" =: датаКон]
