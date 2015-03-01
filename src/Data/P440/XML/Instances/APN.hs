{-#LANGUAGE OverloadedStrings#-}
module Data.P440.XML.Instances.APN where

import qualified Data.P440.Domain.APN as APN
import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes

import Data.P440.XML.XML
import qualified Data.P440.XML.Instances.SimpleTypes
import qualified Data.P440.XML.Instances.ComplexTypes as C
import qualified Data.P440.XML.Instances.ComplexTypesZS as C

instance ToNode APN.Файл where
    toNode (APN.Файл идЭС версПрог телОтпр
                     должнОтпр фамОтпр решение) =
        complex "Файл"
                ["ИдЭС"      =: идЭС
                ,"ВерсПрог"  =: версПрог
                ,"ТелОтпр"   =: телОтпр
                ,"ДолжнОтпр" =: должнОтпр
                ,"ФамОтпр"   =: фамОтпр]
                [Single решение]

instance ToNode APN.Решение where
    toNode (APN.Решение номРеш датаПодп видРеш банкПл
                        бикбПл инннп кппнп номОтмРеш датаОтмРеш
                        приостПоруч свНО руководитель) =
        complex "Решение"
                ["НомРеш"     =: номРеш
                ,"ДатаПодп"   =: датаПодп
                ,"ВидРеш"     =: видРеш
                ,"БанкПл"     =: банкПл
                ,"БИКБПл"     =: бикбПл
                ,"ИНННП"      =: инннп
                ,"КППНП"      =: кппнп
                ,"НомОтмРеш"  =: номОтмРеш
                ,"ДатаОтмРеш" =: датаОтмРеш]
                [Sequence приостПоруч
                ,Single $ C.свНО "СвНО" свНО
                ,Single $ C.рукНО "Руководитель" руководитель]

instance ToNode APN.ПриостПоруч where
    toNode (APN.ПриостПоруч номПоруч датаПоруч
                            видСч сумма номСчПлИлиКЭСП) =
        complex "ПриостПоруч"
                ["НомПоруч"  =: номПоруч
                ,"ДатаПоруч" =: датаПоруч
                ,"ВидСч"     =: видСч
                ,"Сумма"     =: сумма]
                [Sequence номСчПлИлиКЭСП]

instance ToNode APN.НомСчПлИлиКЭСП where
    toNode (APN.Счет (НомСч номСч)) = simple "НомСчПл" номСч
    toNode (APN.КЭСП идКЭСП) = simple "ИдКЭСП" идКЭСП
