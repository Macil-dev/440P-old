{-#LANGUAGE DeriveDataTypeable#-}
module Data.P440.Domain.Model.Types where

import Data.P440.Domain.SimpleTypes
import qualified Data.P440.Domain.ComplexTypes as C

import Data.Typeable (Typeable)

import Control.Lens

import Data.Text

class ЭлектронноеСообщение a where
    идСообщения   :: Lens' a GUID
    датаСообщения :: Lens' a Date

data Налогоплательщик =
      НалогоплательщикЮЛ C.ПлЮЛ
    | НалогоплательщикИП C.ПлФЛ
    | НалогоплательщикФЛ C.ПлФЛ
    deriving (Eq, Show, Typeable)

class ЕстьНалогоплательщик a where
    налогоплательшик :: Getter a Налогоплательщик

class ЕстьНаименование a where
    наименование :: Getter a Text

class ЕстьИННЮЛ a where
    иннюл :: Lens' a ИННЮЛ

class ЕстьИННФЛ a where
    иннфл :: Lens' a ИННФЛ

class ЕстьКПП a where
    кпп :: Lens' a КПП

class ЕстьБанк a where
    банк :: Lens' a C.Банк

class ЕстьБИК a where
    бик :: Lens' a БИК

class ЕстьСвНО a where
    свНО :: Lens' a C.СвНО

class EстьКодНО a where
    кодНО :: Lens' a ИФНС

class ЕстьДата a where
    дата :: Lens' a Date

class ЕстьНомер a where
    номер :: Lens' a Text

class ЕстьРуководительНО a where
    руководительНО :: Lens' a C.РукНО

class ЕстьПредставительБанка a where
    представительБанка :: Lens' a C.ПредБ
