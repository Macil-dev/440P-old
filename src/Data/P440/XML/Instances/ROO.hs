{-#LANGUAGE OverloadedStrings#-}
module Data.P440.XML.Instances.ROO where

import qualified Data.P440.Domain.ROO as ROO
import Data.P440.Domain.ComplexTypes

import Data.P440.XML.XML
import qualified Data.P440.XML.Instances.ComplexTypes as C

instance ToNode ROO.Файл where
    toNode (ROO.Файл идЭС версПрог телОтпр
                     должнОтпр фамОтпр решОтмена) =
        complex "Файл"
                ["ИдЭС"      =: идЭС
                ,"ВерсПрог"  =: версПрог
                ,"ТелОтпр"   =: телОтпр
                ,"ДолжнОтпр" =: должнОтпр
                ,"ФамОтпр"   =: фамОтпр]
                [Sequence [решОтмена]]

instance ToNode ROO.РешОтмена where
    toNode (ROO.РешОтмена номРешОт датаПодп видРеш номРешВО
                          датаРешВО номРешПр датаРешПр бик
                          наимБ номФ свНО свПл
                          счет кэсп руководитель) =
        complex "РешОтмена"
                ["НомРешОт"  =: номРешОт
                ,"ДатаПодп"  =: датаПодп
                ,"ВидРеш"    =: видРеш
                ,"НомРешВО"  =: номРешВО
                ,"ДатаРешВО" =: датаРешВО
                ,"НомРешПр"  =: номРешПр
                ,"ДатаРешПр" =: датаРешПр
                ,"БИК"       =: бик
                ,"НаимБ"     =: наимБ
                ,"НомФ"      =: номФ]
                [Sequence [C.свНО "СвНО" свНО]
                ,Sequence [свПл]
                ,Sequence счет
                ,Sequence кэсп
                ,Sequence [C.рукНО "Руководитель" руководитель]]

instance ToNode ROO.СвПл where
    toNode (ROO.СвПл плательщик адрПлат) =
        complex "СвПл"
                []
                [Sequence [плательщик]
                ,Sequence [адрПлат]]

instance ToNode ROO.ПлЮЛИлиПлИП where
    toNode (ROO.ПлЮЛ' плюл) = C.плЮЛ "ПлЮЛ" плюл
    toNode (ROO.ПлИП' плип) = C.плФЛ "ПлИП" плип

instance ToNode ROO.Счет where
    toNode (ROO.Счет номСч видСч) =
        complex_ "Счет"
                 [ "НомСч" =: номСч
                 , "ВидСч" =: видСч]

instance ToNode ROO.КЭСП where
    toNode (ROO.КЭСП идКЭСП валКЭСП) =
        complex_ "КЭСП"
                 [ "ИдКЭСП"  =: идКЭСП
                 , "ВалКЭСП" =: валКЭСП]
