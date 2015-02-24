{-#LANGUAGE OverloadedStrings#-}
module Data.P440.XML.Instances.RPO where

import qualified Data.P440.Domain.RPO as RPO
import Data.P440.Domain.ComplexTypes

import Data.P440.XML.XML
import qualified Data.P440.XML.Instances.ComplexTypes as C

instance ToNode RPO.РешПриост where
    toNode (RPO.РешПриост номРешПр датаПодп кодОснов обстоят
                          бик наимБ    номФ     сумВзыск
                          номРешВзыск датаРешВзыск свНО
                          свПл счет кэсп руководитель) =
        complex "РешПриост"
                ["НомРешПр"     =: номРешПр
                ,"ДатаПодп"     =: датаПодп
                ,"КодОснов"     =: кодОснов
                ,"Обстоят"      =: обстоят
                ,"БИК"          =: бик
                ,"НаимБ"        =: наимБ
                ,"НомФ"         =: номФ
                ,"СумВзыск"     =: сумВзыск
                ,"НомРешВзыск"  =: номРешВзыск
                ,"ДатаРешВзыск" =: датаРешВзыск]
                [Sequence [C.свНО "СвНО" свНО]
                ,Sequence [свПл]
                ,Sequence счет
                ,Sequence кэсп
                ,Sequence [C.рукНО "Руководитель" руководитель]]

instance ToNode RPO.СвПл where
    toNode (RPO.СвПл плательщик адрПлат) =
        complex "СвПл"
                []
                [Sequence [плательщик]
                ,Sequence [адрПлат]]

instance ToNode RPO.ПлЮЛИлиПлИП where
    toNode (RPO.ПлЮЛ' плюл) = C.плЮЛ "ПлЮЛ" плюл
    toNode (RPO.ПлИП' плип) = C.плФЛ "ПлИП" плип

instance ToNode RPO.Счет where
    toNode (RPO.Счет номСч видСч) =
        complex_ "Счет"
                 [ "НомСч" =: номСч
                 , "ВидСч" =: видСч]

instance ToNode RPO.КЭСП where
    toNode (RPO.КЭСП идКЭСП валКЭСП) =
        complex_ "КЭСП"
                 [ "ИдКЭСП"  =: идКЭСП
                 , "ВалКЭСП" =: валКЭСП]
