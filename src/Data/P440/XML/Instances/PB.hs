{-#LANGUAGE OverloadedStrings#-}
module Data.P440.XML.Instances.PB where

import qualified Data.P440.Domain.PB as PB
import Data.P440.Domain.SimpleTypes

import Data.P440.XML.XML
import Data.P440.XML.Instances.SimpleTypes

instance ToNode PB.Файл where
    toNode (PB.Файл идЭС версПрог телОтпр
                     должнОтпр фамОтпр подтверждение) =
        complex "Файл"
                ["ИдЭС"      =: идЭС
                ,"ВерсПрог"  =: версПрог
                ,"ТелОтпр"   =: телОтпр
                ,"ДолжнОтпр" =: должнОтпр
                ,"ФамОтпр"   =: фамОтпр]
                [Single подтверждение]

instance ToNode PB.Подтверждение where
    toNode (PB.Подтверждение имяФайла датаВремяПроверки результат) =
        complex "Подтверждение"
                ["ИмяФайла"          =: имяФайла
                ,"ДатаВремяПроверки" =: датаВремяПроверки]
                [Sequence результат]

instance ToNode PB.Результат where
    toNode (PB.Результат кодРезПроверки пояснение кодРекв значРекв) =
        complex_ "Результат"
                 ["КодРезПроверки" =: кодРезПроверки
                 ,"Пояснение"      =: пояснение
                 ,"КодРекв"        =: кодРекв
                 ,"ЗначРекв"       =: значРекв]
