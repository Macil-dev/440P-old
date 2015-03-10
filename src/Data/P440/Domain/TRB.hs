{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.TRB where

import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes
import Data.P440.Domain.ComplexTypesZS

import Data.Typeable (Typeable)

import Data.Text (Text)

-- 2.7 Требование НО

data Файл = Файл {
     идЭС      :: GUID
    ,версПрог  :: Text
    ,телОтпр   :: Text
    ,должнОтпр :: Text
    ,фамОтпр   :: Text
    ,требованиеНО :: ТребованиеНО
} deriving (Eq, Show, Typeable)

data ТребованиеНО = ТребованиеНО {
     номТреб   :: Text
    ,датаПодп  :: Date
    ,номСооб   :: Maybe Text
    ,датаСооб  :: Maybe Date
    ,номПоруч  :: Text
    ,датаПоруч :: Date
    ,суммаПлат :: Text
    ,кбк       :: Text
    ,октмо     :: Text
    ,срокИсп   :: Text
    ,сведВзыск :: Text
    ,фамИсп    :: Text
    ,телИсп    :: Text
    ,свНО      :: СвНО
    ,плЮЛИлиПлФЛ :: ПлЮЛИлиПлФЛ
    ,свБанк    :: СвБанкИлиСвУБР
    ,руководитель :: РукНО
} deriving (Eq, Show, Typeable)

data ПлЮЛИлиПлФЛ = ПлЮЛ' ПлЮЛ
                 | ПлФЛ' ПлФЛ
                 deriving (Eq, Show, Typeable)
