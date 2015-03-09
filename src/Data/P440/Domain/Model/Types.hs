{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.Model.Types where

import qualified Data.P440.Domain.ComplexTypes as C

import Data.Typeable (Typeable)

import Control.Lens

import Data.Text

class ЭлектронныйДокумент a where
    идДокумента   :: Lens' a Text
    датаДокумента :: Lens' a Text
    датаОперации  :: Lens' a Text

data Налогоплательщик =
      НалогоплательщикЮЛ C.ПлЮЛ
    | НалогоплательщикИП C.ПлФЛ
    | НалогоплательщикФЛ C.ПлФЛ
    deriving (Eq, Show, Typeable)

class ЕстьНалогоплательщик a where
    налогоплательшик :: Getter a Налогоплательщик

class ЕстьНаименование a where
    наименование :: Getter a Text
