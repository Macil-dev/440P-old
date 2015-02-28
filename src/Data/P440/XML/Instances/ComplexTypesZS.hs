{-#LANGUAGE OverloadedStrings#-}
module Data.P440.XML.Instances.ComplexTypesZS where

import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypesZS hiding (плФЛ)

import Data.P440.XML.XML
import Data.P440.XML.Instances.ComplexTypes
import Data.P440.XML.Instances.SimpleTypes

instance ToNode НаДатуИлиЗаПериод where
    toNode (НаДату датаПоСост) =
        complex_ "НаДату"
                 ["ДатаПоСост" =: датаПоСост]
    toNode (ЗаПериод датаНач датаКон) =
        complex_ "ЗаПериод"
                 ["ДатаНач" =: датаНач
                 ,"ДатаКон" =: датаКон]

instance ToNode СвПл where
    toNode (ПлЮЛ' плЮЛ') =
        complex "СвПл"
                []
                [Single $ плЮЛ "ПлЮЛ" плЮЛ']
    toNode (ПлФЛ' плФЛ' датаРожд адрПлат) =
        complex "СвПл"
                []
                [Single $ complex "ПлФЛ"
                                  ["ДатаРожд" =: датаРожд]
                                  [Single $ плФЛ "ПлФЛ" плФЛ'
                                  ,Sequence адрПлат]]

instance ToNode СвБанкИлиСвУБР where
    toNode (СвБанк свБанк) =
        банк "СвБанк" свБанк
    toNode (СвУБР свУБР) =
        убр "СвУБР" свУБР
