{-#LANGUAGE OverloadedStrings#-}
module Data.P440.XML.Instances.ZSN where

import qualified Data.P440.Domain.ZSN as ZSN
import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes

import Data.P440.XML.XML
import qualified Data.P440.XML.Instances.SimpleTypes
import qualified Data.P440.XML.Instances.ComplexTypes as C
import qualified Data.P440.XML.Instances.ComplexTypesZS as C

instance ToNode ZSN.Файл where
    toNode (ZSN.Файл идЭС версПрог телОтпр
                     должнОтпр фамОтпр запросНал) =
        complex "Файл"
                ["ИдЭС"      =: идЭС
                ,"ВерсПрог"  =: версПрог
                ,"ТелОтпр"   =: телОтпр
                ,"ДолжнОтпр" =: должнОтпр
                ,"ФамОтпр"   =: фамОтпр]
                [Single запросНал]

instance ToNode ZSN.ЗапросНал where
    toNode (ZSN.ЗапросНал номЗапр стНКРФ видЗапр основЗапр признЗапр
                          датаПодп наДатуИлиЗаПериод свНО свПл банкИлиУБР руководитель) =
        complex "ЗапросНал"
                ["НомЗапр"   =: номЗапр
                ,"СтНКРФ"    =: стНКРФ
                ,"ВидЗапр"   =: видЗапр
                ,"ОсновЗапр" =: основЗапр
                ,"ПризнЗапр" =: признЗапр
                ,"ДатаПодп"  =: датаПодп]
                [Single наДатуИлиЗаПериод
                ,Single $ C.свНО "СвНО" свНО
                ,Single свПл
                ,Single банкИлиУБР
                ,Single $ C.рукНО "Руководитель" руководитель]
