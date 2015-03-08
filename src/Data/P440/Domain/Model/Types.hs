module Data.P440.Domain.Model.Types where

import Control.Lens

import Data.Text

class ЭлектронныйДокумент a where
    идДокумента   :: Lens' a Text
    датаДокумента :: Lens' a Text
    датаОперации  :: Lens' a Text
