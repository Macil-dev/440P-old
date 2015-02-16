{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.ComplexTypesZS where

import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes

import Data.Typeable (Typeable)

import Data.Text (Text)

-- Сложные типы, используемые в запросах пп. 2.4-2.6
-- TODO: Проверить соответстиве форматам


-- Используется в ZSN, ZSV, BNS, BVS
data НаДатуИлиЗаПериод = НаДату { датаПоСост :: Date }
                       | ЗаПериод { датаНач :: Date
                                  , датаКон :: Date
                                  }
                       deriving (Eq, Show, Typeable)

data СвПл = ПлЮЛ' ПлЮЛ
          | ПлФЛ' { плФЛ     :: ПлФЛ
                  , датаРожд :: Maybe Date
                  , адрПлат  :: Maybe АдрРФ
                  } deriving (Eq, Show, Typeable)

data СвБанкИлиСвУБР = СвБанк Банк
                    | СвУБР УБР
                    deriving (Eq, Show, Typeable)
