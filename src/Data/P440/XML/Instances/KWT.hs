{-#LANGUAGE OverloadedStrings#-}
module Data.P440.XML.Instances.KWT where

import qualified Data.P440.Domain.KWT as KWT
import Data.P440.Domain.SimpleTypes

import Data.P440.XML.XML
import Data.P440.XML.Instances.SimpleTypes

instance ToNode KWT.Файл where
    toNode (KWT.Файл идЭС версПрог телОтпр
                     должнОтпр фамОтпр квитанция) =
        complex "Файл"
                ["ИдЭС"      =: идЭС
                ,"ВерсПрог"  =: версПрог
                ,"ТелОтпр"   =: телОтпр
                ,"ДолжнОтпр" =: должнОтпр
                ,"ФамОтпр"   =: фамОтпр]
                [Single квитанция]

instance ToNode KWT.Квитанция where
    toNode (KWT.Квитанция имяФайла датаВремяПроверки результат) =
        complex "Квитанция"
                ["ИмяФайла"          =: имяФайла
                ,"ДатаВремяПроверки" =: датаВремяПроверки]
                [Sequence результат]

instance ToNode KWT.Результат where
    toNode (KWT.Результат кодРезПроверки пояснение кодРекв значРекв) =
        complex_ "Результат"
                 ["КодРезПроверки" =: кодРезПроверки
                 ,"Пояснение"      =: пояснение
                 ,"КодРекв"        =: кодРекв
                 ,"ЗначРекв"       =: значРекв]
