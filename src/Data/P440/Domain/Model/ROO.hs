module Data.P440.Domain.Model.ROO where

import qualified Data.P440.Domain.ROO as ROO

import Data.P440.Domain.Model.Types

import Control.Lens

instance ЭлектронноеСообщение ROO.Файл where
    идСообщения =
        lens ROO.идЭС
             (\файл идЭС -> файл{ROO.идЭС=идЭС})
    датаСообщения =
        lens (\файл -> ROO.датаПодп . ROO.решОтмена $ файл)
             (\файл датаПодп -> файл{ROO.решОтмена=(ROO.решОтмена файл){ROO.датаПодп = датаПодп}})
