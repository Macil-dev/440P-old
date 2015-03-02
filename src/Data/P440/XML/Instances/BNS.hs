{-#LANGUAGE OverloadedStrings#-}
module Data.P440.XML.Instances.BNS where

import qualified Data.P440.Domain.BNS as BNS
import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes

import Data.P440.XML.XML
import qualified Data.P440.XML.Instances.ComplexTypes as C
import qualified Data.P440.XML.Instances.ComplexTypesZS as C

instance ToNode BNS.Файл where
    toNode (BNS.Файл идЭС версПрог телОтпр
                     должнОтпр фамОтпр справНалич) =
        complex "Файл"
                ["ИдЭС"      =: идЭС
                ,"ВерсПрог"  =: версПрог
                ,"ТелОтпр"   =: телОтпр
                ,"ДолжнОтпр" =: должнОтпр
                ,"ФамОтпр"   =: фамОтпр]
                [Single справНалич]

instance ToNode BNS.СправНалич where
    toNode (BNS.СправНалич номСправ номЗапр датаПодпЗапр наимПодтв
                           призНал датаПодп наДатуИлиЗаПериод свНО свБанкИлиУБР
                           свПл свСчет свВклад предБанка) =
        complex "СправНалич"
                ["НомСправ"     =: номСправ
                ,"НомЗапр"      =: номЗапр
                ,"ДатаПодпЗапр" =: датаПодпЗапр
                ,"НаимПодтв"    =: наимПодтв
                ,"ПризНал"      =: призНал
                ,"ДатаПодп"     =: датаПодп]
                [Single $ наДатуИлиЗаПериод
                ,Single $ C.свНО "СвНО" свНО
                ,Single $ свБанкИлиУБР
                ,Single $ свПл
                ,Sequence $ свСчет
                ,Sequence $ свВклад
                ,Single $ C.предБ "ПредБанка" предБанка]

instance ToNode BNS.ПлЮЛИлиПлИП where
    toNode (BNS.ПлЮЛ' плюл) = C.плЮЛ "ПлЮЛ" плюл
    toNode (BNS.ПлИП' плип) = C.плФЛ "ПлИП" плип

instance ToNode BNS.СвСчет where
    toNode (BNS.СвСчет номСч видСч датаОткрСч
                       датаЗакрСч кодВалСч) =
        complex_ "СвСчет"
                 ["НомСч"    =: номСч
                 ,"ВидСч"    =: видСч
                 ,"ДатаОткр" =: датаОткрСч
                 ,"ДатаЗакр" =: датаЗакрСч
                 ,"КодВал"   =: кодВалСч]

instance ToNode BNS.СвВклад where
    toNode (BNS.СвВклад номВкл видВкл кодВалВклад датаОткрВклад
                        датаИстВклад датаЗакрВклад суммаВкл проценты) =
        complex_ "СвВклад"
                 ["НомВкл"   =: номВкл
                 ,"ВидВкл"   =: видВкл
                 ,"КодВал"   =: кодВалВклад
                 ,"ДатаОткр" =: датаОткрВклад
                 ,"ДатаИст"  =: датаИстВклад
                 ,"ДатаЗакр" =: датаЗакрВклад
                 ,"СуммаВкл" =: суммаВкл
                 ,"Проценты" =: проценты]
