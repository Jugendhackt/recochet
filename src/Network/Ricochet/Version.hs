{-# LANGUAGE OverloadedStrings #-}

module Network.Ricochet.Version
  ( Versions ()
  , Version ()
  , ConnectionHandler ()
  , parseIntroduction
  ) where

import           Prelude                    hiding (lookup)

import           Network.Ricochet.Monad
import           Network.Ricochet.Types

import           Control.Applicative        ((<|>))
import           Data.Attoparsec.ByteString
import           Data.ByteString            (ByteString ())
import qualified Data.ByteString            as B
import           Data.Map                   (Map (), lookup)
import           Data.Monoid                ((<>))
import           GHC.Word                   (Word8 ())

-- | A Version is a Word8 as defined by the ricochet protocol
type Version = Word8

-- | Handles a connection between two users
type ConnectionHandler = Connection -> Ricochet ()

-- | Each version (Word8) has its own Handler that takes a Connection which has
-- completed version negotiation and does Ricochet actions
type Versions = Map Version ConnectionHandler

-- | Parses Introduction and Version Negotiation of the protocol
parseIntroduction :: Map Version ConnectionHandler -> Parser (Maybe [ConnectionHandler])
parseIntroduction supportedVersions = failingParser <|> return Nothing
  where failingParser = do
          string "IM"
          nVersions <- anyWord8
          foldJustAround . (fmap . flip lookup $ supportedVersions) <$>
            count (fromIntegral nVersions) anyWord8

-- | Takes a list of [Maybe a] and returns a Maybe [a]. During the process all Nothings are skipped.
-- Nothing is returened if either the list is empty or it only contains Nothings.
-- TODO: evaluate wether there is a more generic function doing the job
foldJustAround :: [Maybe a] -> Maybe [a]
foldJustAround  = foldl folder Nothing
  where folder Nothing Nothing   = Nothing
        folder Nothing (Just x)  = Just [x]
        folder (Just l) Nothing  = Just l
        folder (Just l) (Just x) = Just (l <> [x])
