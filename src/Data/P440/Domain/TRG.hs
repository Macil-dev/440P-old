{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.TRG where

import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes
import Data.P440.Domain.ComplexTypesZS hiding (СвПл)

import Data.Typeable (Typeable)

import Data.Text (Text)

-- 2.8 Требование по банковской гарантии

data Файл = Файл {
     идЭС      :: GUID
    ,версПрог  :: Text
    ,телОтпр   :: Text
    ,должнОтпр :: Text
    ,фамОтпр   :: Text
    ,требованиеБГ :: ТребованиеБГ
} deriving (Eq, Show, Typeable)

data ТребованиеБГ = ТребованиеБГ {
     номТреб      :: Text
    ,датаПодп     :: Date
    ,номБГ        :: Text
    ,датаБГ       :: Date
    ,номТребУпл   :: Text
    ,датаТребУпл  :: Date
    ,суммаПлат    :: Text
    ,срокПлат     :: Date
    ,кбк          :: Text
    ,октмо        :: Text
    ,фамИсп       :: Text
    ,телИсп       :: Text
    ,свНО         :: СвНО
    ,свПл         :: СвПл
    ,руководитель :: РукНО
} deriving (Eq, Show, Typeable)

data СвПл = СвПл {
     плательщик :: ПлЮЛИлиПлИП
    ,адрПлат    :: АдрРФ
} deriving (Eq, Show, Typeable)

data ПлЮЛИлиПлИП = ПлЮЛ' ПлЮЛ
                 | ПлИП' ПлФЛ
                 deriving (Eq, Show, Typeable)
