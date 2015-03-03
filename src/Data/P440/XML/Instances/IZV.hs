{-#LANGUAGE OverloadedStrings#-}
module Data.P440.XML.Instances.IZV where

import qualified Data.P440.Domain.IZV as IZV
import Data.P440.Domain.SimpleTypes

import Data.P440.XML.XML
import Data.P440.XML.Instances.SimpleTypes

instance ToNode IZV.Файл where
    toNode (IZV.Файл идЭС версПрог телОтпр
                     должнОтпр фамОтпр извещение) =
        complex "Файл"
                ["ИдЭС"      =: идЭС
                ,"ВерсПрог"  =: версПрог
                ,"ТелОтпр"   =: телОтпр
                ,"ДолжнОтпр" =: должнОтпр
                ,"ФамОтпр"   =: фамОтпр]
                [Single извещение]

instance ToNode IZV.Извещение where
    toNode (IZV.Извещение имяФайла кодРезПроверки
                              датаВремяПроверки датаВремяПериода) =
        complex_ "Извещение"
                 ["ИмяФайла"          =: имяФайла
                 ,"КодРезПроверки"    =: кодРезПроверки
                 ,"ДатаВремяПроверки" =: датаВремяПроверки
                 ,"ДатаВремяПериода"  =: датаВремяПериода]
