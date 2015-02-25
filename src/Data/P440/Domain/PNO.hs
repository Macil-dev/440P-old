{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.PNO where

import Data.P440.Domain.SimpleTypes
import Data.P440.Domain.ComplexTypes

import Data.Typeable (Typeable)

import Data.Text (Text)

-- 2.3 Инкассовое поручение

data Файл = Файл {
     идЭС      :: GUID
    ,версПрог  :: Text
    ,телОтпр   :: Text
    ,должнОтпр :: Text
    ,фамОтпр   :: Text
    ,поручНО   :: ПоручНО
} deriving (Eq, Show, Typeable)

data ПоручНО = ПоручНО {
     номПоруч   :: Text
    ,датаПодп   :: Date
    ,видПлат    :: Maybe Text
    ,сумПлат    :: Text
    ,статус     :: Maybe Text
    ,инннп      :: Text
    ,кппнп      :: Maybe КПП
    ,плательщ   :: Text
    ,номСчПлИлиКЭСП :: Maybe НомСчПлИлиКЭСП
    ,банкПл     :: Text
    ,бикбПл     :: БИК
    ,номСчБПл   :: Maybe Text
    ,номФ       :: Text
    ,банкПол    :: Text
    ,бикбПол    :: БИК
    ,номСчБПол  :: Maybe Text
    ,иннПол     :: Text
    ,кппПол     :: Maybe КПП
    ,получ      :: Text
    ,номСчПол   :: Maybe Text
    ,видОп      :: Text
    ,назПлКод   :: Maybe Text
    ,очерПл     :: Text
    ,кодПл      :: Maybe Text
    ,резПоле    :: Maybe Text
    ,назнПл     :: Text
    ,кгн        :: Maybe Text
    ,укгн       :: Maybe Text
    ,кбк        :: Text
    ,октмо      :: Text
    ,кодОсн     :: Maybe Text
    ,срокУплТр  :: Maybe Text
    ,номТреб    :: Maybe Text
    ,датаТреб   :: Maybe Date
    ,типПлат    :: Text
    ,порВал     :: Maybe ПорВал
} deriving (Eq, Show, Typeable)

data НомСчПлИлиКЭСП = Счет НомСч
                    | КЭСП Text
                    deriving (Eq, Show, Typeable)

data ПорВал = ПорВал {
     номПорВал  :: Text
    ,датаПорВал :: Date
    ,номВалСч   :: Text
} deriving (Eq, Show, Typeable)
