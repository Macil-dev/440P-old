module Data.P440.Text.Render.FilenameAst where

import Data.P440.Domain.FilenameAst

import Data.Monoid

import Data.Text (Text)
import Data.Text.Lazy.Builder

sep :: Builder
sep = singleton '_'

fromDate :: (Text, Text, Text) -> Builder
fromDate (y, m, d) =
    fromText y <> fromText m <> fromText d

fromMessage :: Message -> Builder
fromMessage msg =
       (fromText $ messagePrefix msg)
    <> (fromText $ messageResend msg)
    <> (fromText $ messageBIC msg)
    <> sep
    <> (fromText $ messageTaxcode msg)
    <> (fromDate $ messageFiledate msg)
    <> sep
    <> (fromText $ messageNumber msg)

fromReply :: Reply -> Builder
fromReply repl =
       (fromText $ replyPrefix repl)
    <> (fromText $ replyResend repl)
    <> sep
    <> (fromMessage $ replyMessage repl)
    <> sep
    <> (fromText $ replyDivision repl)


fromAdditionalReply :: AdditionalReply -> Builder
fromAdditionalReply arepl =
       (fromText $ areplyPrefix arepl)
    <> (fromText $ areplyResend arepl)
    <> sep
    <> (fromMessage $ areplyMessage arepl)
    <> sep
    <> (fromText $ areplyDivision arepl)
    <> sep
    <> (fromText $ areplyAccountNum arepl)
    <> sep
    <> (fromText $ areplyFilenum arepl)

fromTransport :: Transport -> Builder
fromTransport tran =
       (fromText $ transportPrefix tran)
    <> sep
    <> (fromText $ transportSender tran)
    <> sep
    <> (fromText $ transportReceiver tran)
    <> sep
    <> (fromDate $ transportFiledate tran)
    <> sep
    <> (fromText $ transportFilenum tran)

fromTransportAck :: TransportAck -> Builder
fromTransportAck tack =
       (fromText $ tackPrefix tack)
    <> (fromText $ tackReceiver tack)
    <> sep
    <> (fromTransport $ tackAckTransport tack)

fromFNSAck :: FNSAck -> Builder
fromFNSAck fack =
       (fromText $ fackPrefix fack)
    <> (fromText $ fackReceiver fack)
    <> sep
    <> (fromFnsAckName $ fackReply fack)

fromFnsAckName :: FNSAckName -> Builder
fromFnsAckName (KOAck1' kack1) = fromKOAck1 kack1
fromFnsAckName (KOAck2' kack2) = fromKOAck2 kack2
fromFnsAckName (Reply' repl) = fromReply repl
fromFnsAckName (AdditionalReply' arepl) = fromAdditionalReply arepl

fromKOAck1 :: KOAck1 -> Builder
fromKOAck1 kack1 =
       (fromText $ kack1Prefix kack1)
    <> sep
    <> (fromMessage $ kack1Message kack1)

fromKOAck2 :: KOAck2 -> Builder
fromKOAck2 kack2 =
       (fromText $ kack2Prefix kack2)
    <> sep
    <> (fromMessage $ kack2Message kack2)
    <> sep
    <> (fromText $ kack2Division kack2)
