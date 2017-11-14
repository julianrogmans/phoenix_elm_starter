module Requests exposing (..)

import Graphql exposing (..)
import Queries exposing (..)
import Decoders exposing (..)
import Msg exposing (Msg, GraphqlResult(..))


graphqlRequest type_ =
    case type_ of
        TestApi result_ ->
            let
                log =
                    Debug.log "TestApi---" "worked"
            in
                Graphql.query result_ testApiQuery decodeTestApi



-- User request_ ->
--     let
--         log =
--             Debug.log "User---" request_
--     in
--         Graphql.query request_ userQuery decodeUser
-- testApiRequest =
--     Graphql.query TestApi testApiQuery decodeTestApi
