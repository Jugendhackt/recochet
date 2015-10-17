{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Protocol.Data.Chat (protoInfo, fileDescriptorProto) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import Text.DescriptorProtos.FileDescriptorProto (FileDescriptorProto)
import Text.ProtocolBuffers.Reflections (ProtoInfo)
import qualified Text.ProtocolBuffers.WireMessage as P' (wireGet,getFromBS)
 
protoInfo :: ProtoInfo
protoInfo
 = Prelude'.read
    "ProtoInfo {protoMod = ProtoName {protobufName = FIName \".Protocol.Data.Chat\", haskellPrefix = [], parentModule = [MName \"Protocol\",MName \"Data\"], baseName = MName \"Chat\"}, protoFilePath = [\"Protocol\",\"Data\",\"Chat.hs\"], protoSource = \"ChatChannel.proto\", extensionKeys = fromList [], messages = [DescriptorInfo {descName = ProtoName {protobufName = FIName \".Protocol.Data.Chat.Packet\", haskellPrefix = [], parentModule = [MName \"Protocol\",MName \"Data\",MName \"Chat\"], baseName = MName \"Packet\"}, descFilePath = [\"Protocol\",\"Data\",\"Chat\",\"Packet.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.Data.Chat.Packet.chat_message\", haskellPrefix' = [], parentModule' = [MName \"Protocol\",MName \"Data\",MName \"Chat\",MName \"Packet\"], baseName' = FName \"chat_message\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Protocol.Data.Chat.ChatMessage\", haskellPrefix = [], parentModule = [MName \"Protocol\",MName \"Data\",MName \"Chat\"], baseName = MName \"ChatMessage\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.Data.Chat.Packet.chat_acknowledge\", haskellPrefix' = [], parentModule' = [MName \"Protocol\",MName \"Data\",MName \"Chat\",MName \"Packet\"], baseName' = FName \"chat_acknowledge\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Protocol.Data.Chat.ChatAcknowledge\", haskellPrefix = [], parentModule = [MName \"Protocol\",MName \"Data\",MName \"Chat\"], baseName = MName \"ChatAcknowledge\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False},DescriptorInfo {descName = ProtoName {protobufName = FIName \".Protocol.Data.Chat.ChatMessage\", haskellPrefix = [], parentModule = [MName \"Protocol\",MName \"Data\",MName \"Chat\"], baseName = MName \"ChatMessage\"}, descFilePath = [\"Protocol\",\"Data\",\"Chat\",\"ChatMessage.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.Data.Chat.ChatMessage.message_text\", haskellPrefix' = [], parentModule' = [MName \"Protocol\",MName \"Data\",MName \"Chat\",MName \"ChatMessage\"], baseName' = FName \"message_text\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.Data.Chat.ChatMessage.message_id\", haskellPrefix' = [], parentModule' = [MName \"Protocol\",MName \"Data\",MName \"Chat\",MName \"ChatMessage\"], baseName' = FName \"message_id\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.Data.Chat.ChatMessage.time_delta\", haskellPrefix' = [], parentModule' = [MName \"Protocol\",MName \"Data\",MName \"Chat\",MName \"ChatMessage\"], baseName' = FName \"time_delta\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False},DescriptorInfo {descName = ProtoName {protobufName = FIName \".Protocol.Data.Chat.ChatAcknowledge\", haskellPrefix = [], parentModule = [MName \"Protocol\",MName \"Data\",MName \"Chat\"], baseName = MName \"ChatAcknowledge\"}, descFilePath = [\"Protocol\",\"Data\",\"Chat\",\"ChatAcknowledge.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.Data.Chat.ChatAcknowledge.message_id\", haskellPrefix' = [], parentModule' = [MName \"Protocol\",MName \"Data\",MName \"Chat\",MName \"ChatAcknowledge\"], baseName' = FName \"message_id\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Protocol.Data.Chat.ChatAcknowledge.accepted\", haskellPrefix' = [], parentModule' = [MName \"Protocol\",MName \"Data\",MName \"Chat\",MName \"ChatAcknowledge\"], baseName' = FName \"accepted\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"true\", hsDefault = Just (HsDef'Bool True)}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}], enums = [], knownKeyMap = fromList []}"
 
fileDescriptorProto :: FileDescriptorProto
fileDescriptorProto
 = P'.getFromBS (P'.wireGet 11)
    (P'.pack
      "\179\STX\n\DC1ChatChannel.proto\DC2\DC2Protocol.Data.Chat\"~\n\ACKPacket\DC25\n\fchat_message\CAN\SOH \SOH(\v2\US.Protocol.Data.Chat.ChatMessage\DC2=\n\DLEchat_acknowledge\CAN\STX \SOH(\v2#.Protocol.Data.Chat.ChatAcknowledge\"K\n\vChatMessage\DC2\DC4\n\fmessage_text\CAN\SOH \STX(\t\DC2\DC2\n\nmessage_id\CAN\STX \SOH(\r\DC2\DC2\n\ntime_delta\CAN\ETX \SOH(\ETX\"=\n\SIChatAcknowledge\DC2\DC2\n\nmessage_id\CAN\SOH \SOH(\r\DC2\SYN\n\baccepted\CAN\STX \SOH(\b:\EOTtrue")