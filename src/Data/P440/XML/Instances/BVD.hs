{-#LANGUAGE OverloadedStrings#-}
module Data.P440.XML.Instances.BVD where

import qualified Data.P440.Domain.BVD as BVD
import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes

import Data.P440.XML.XML
import qualified Data.P440.XML.Instances.ComplexTypes as C

instance ToNode BVD.Файл where
    toNode (BVD.Файл идЭС версПрог телОтпр
                     должнОтпр фамОтпр счет) =
        complex "Файл"
                ["ИдЭС"      =: идЭС
                ,"ВерсПрог"  =: версПрог
                ,"ТелОтпр"   =: телОтпр
                ,"ДолжнОтпр" =: должнОтпр
                ,"ФамОтпр"   =: фамОтпр]
                [Single счет]

instance ToNode BVD.Счет where
    toNode (BVD.Счет порНом порНомДФ номСчВклЭС операции) =
        complex "Счет"
                ["ПорНом"     =: порНом
                ,"ПодНомДФ"   =: порНомДФ
                ,"НомСчВклЭС" =: номСчВклЭС]
                [Sequence операции]

instance ToNode BVD.Операции where
    toNode (BVD.Операции идБлок датаОпер времяОпер
                         назнПл ипАдр номТел кодПерев
                         реквДок реквБанка реквПлат суммаОпер) =
        complex "Операции"
                ["ИдБлок"    =: идБлок
                ,"ДатаОпер"  =: датаОпер
                ,"ВремяОпер" =: времяОпер
                ,"НазнПл"    =: назнПл
                ,"ИПадр"     =: ипАдр
                ,"НомТел"    =: номТел
                ,"КодПерев"  =: кодПерев]
                [Single реквДок
                ,Single реквБанка
                ,Single реквПлат
                ,Single суммаОпер]

instance ToNode BVD.РеквДок where
    toNode (BVD.РеквДок видДок номДок датаДок) =
        complex_ "РеквДок"
                 ["ВидДок"  =: видДок
                 ,"НомДок"  =: номДок
                 ,"ДатаДок" =: датаДок]

instance ToNode BVD.РеквБанка where
    toNode (BVD.РеквБанка номКорСч наимБП
                          бикбп свифт) =
        complex_ "РеквБанка"
                 ["НомКорСч" =: номКорСч
                 ,"НаимБП"   =: наимБП
                 ,"БИКБП"    =: бикбп
                 ,"СВИФТ"    =: свифт]

instance ToNode BVD.РеквПлат where
    toNode (BVD.РеквПлат наимПП иннпп кпппп номСчПП) =
        complex_ "РеквПлат"
                 ["НаимПП"  =: наимПП
                 ,"ИННПП"   =: иннпп
                 ,"КПППП"   =: кпппп
                 ,"НомСчПП" =: номСчПП]

instance ToNode BVD.СуммаОпер where
    toNode (BVD.СуммаОпер дебет кредит) =
        complex_ "СуммаОпер"
                 ["Дебет"  =: дебет
                 ,"Кредит" =: кредит]
