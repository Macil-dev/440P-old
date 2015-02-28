{-#LANGUAGE OverloadedStrings#-}
module Data.P440.XML.Instances.ZSO where

import qualified Data.P440.Domain.ZSO as ZSO
import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes

import Data.P440.XML.XML
import qualified Data.P440.XML.Instances.SimpleTypes
import qualified Data.P440.XML.Instances.ComplexTypes as C
import qualified Data.P440.XML.Instances.ComplexTypesZS as C

instance ToNode ZSO.Файл where
    toNode (ZSO.Файл идЭС версПрог телОтпр
                     должнОтпр фамОтпр запросОст) =
        complex "Файл"
                ["ИдЭС"      =: идЭС
                ,"ВерсПрог"  =: версПрог
                ,"ТелОтпр"   =: телОтпр
                ,"ДолжнОтпр" =: должнОтпр
                ,"ФамОтпр"   =: фамОтпр]
                [Single запросОст]

instance ToNode ZSO.ЗапросОст where
    toNode (ZSO.ЗапросОст номЗапр стНКРФ видЗапр основЗапр типЗапр
            признЗапр датаПоСост датаПодп  свНО свПл банкИлиУБР
            счетИлиКЭСП руководитель) =
        complex "ЗапросОст"
                ["НомЗапр"    =: номЗапр
                ,"СтНКРФ"     =: стНКРФ
                ,"ВидЗапр"    =: видЗапр
                ,"ОсновЗапр"  =: основЗапр
                ,"ТипЗапр"    =: типЗапр
                ,"ПризнЗапр"  =: признЗапр
                ,"ДатаПоСост" =: датаПоСост
                ,"ДатаПодп"   =: датаПодп]
                [Single $ C.свНО "СвНО" свНО
                ,Single свПл
                ,Single банкИлиУБР
                ,Sequence счетИлиКЭСП
                ,Single $ C.рукНО "Руководитель" руководитель]

instance ToSequence ZSO.СчетИлиКЭСП where
    toSequence (ZSO.Счет счет) =
        map (\(НомСч номСч) -> complex_ "Счет" ["НомСч" =: номСч]) счет
    toSequence (ZSO.КЭСП кэсп) =
        map (\идКЭСП -> complex_ "КЭСП" ["ИдКЭСП" =: идКЭСП]) кэсп
