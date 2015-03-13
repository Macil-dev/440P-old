{-#LANGUAGE OverloadedStrings#-}
module Data.P440.Text.Parse.Filename where

import qualified Data.P440.Domain.FilenameAst as AST

import Prelude hiding (take)

import Control.Applicative

import Data.Char

import Data.Text (Text)
import qualified Data.Text as T

import Data.Attoparsec.Text

message :: Parser AST.Message
message =
    AST.Message <$> takeWhile1 isAlpha
                <*> (T.singleton <$> digit)
                <*> (take 7)
                <*> (char '_' *> take 4)
                <*> ((,,) <$> take 4 <*> take 2 <*> take 2)
                <*> (char '_' *> take 6)

reply :: Parser AST.Reply
reply =
    AST.Reply <$> takeWhile1 isAlpha
              <*> (T.singleton <$> digit)
              <*> (char '_' *> message)
              <*> (char '_' *> take 4)

auxReply :: Parser AST.AuxReply
auxReply =
    AST.AuxReply <$> reply
                 <*> (char '_' *> take 6)
                 <*> (char '_' *> take 6)

transport :: Parser AST.Transport
transport =
    AST.Transport <$> takeWhile1 isAlpha
                  <*> (char '_' *> takeWhile1 isAlphaNum)
                  <*> (char '_' *> takeWhile1 isAlphaNum <* char '_')
                  <*> ((,,) <$> take 4 <*> take 2 <*> take 2)
                  <*> (char '_' *> takeWhile1 isDigit)

transportAck :: Parser AST.TransportAck
transportAck =
    AST.TransportAck <$> string "IZV"
                     <*> take 3
                     <*> (char '_' *> transport)

fnsAck :: Parser AST.FNSAck
fnsAck = AST.FNSAck <$> string "KWT"
                    <*> take 3
                    <*> (char '_' *> fnsAckName')

fnsAckName' =  AST.KOAck1'   <$> koAck1
           <|> AST.KOAck2'   <$> koAck2
           <|> AST.AuxReply' <$> auxReply
           <|> AST.Reply'    <$> reply

koAck1 :: Parser AST.KOAck1
koAck1 =
    AST.KOAck1 <$> string "PB1"
               <*> (char '_' *>  message)

koAck2 :: Parser AST.KOAck2
koAck2 =
    AST.KOAck2 <$> string "PB2"
               <*> (char '_' *>  message)
               <*> (char '_' *> takeWhile1 isDigit)
