#!/bin/bash
set -e

clickhouse client -n <<-EOSQL
CREATE DATABASE slots;
CREATE TABLE log_events
(
    `id` Int64,
    `id_user` UInt32,
    `split_id` UInt32,
    `date_partition` UInt32,
    `command` String,
    `command_sync` UInt8,
    `is_tech` UInt8,
    `country` String,
    `platform` String,
    `time` DateTime,
    `time_event` Nullable(DateTime),
    `time_client` Nullable(DateTime),
    `time_original` String,
    `api_version` String,
    `app_version` String,
    `is_tester` UInt8,
    `network` Enum8('none' = 1, 'lan' = 2, 'mobile' = 3),
    `param_int1` Nullable(Int32),
    `param_int2` Nullable(Int32),
    `param_int3` Nullable(Int32),
    `param_int4` Nullable(Int32),
    `param_float1` Nullable(Decimal(18, 4)),
    `param_float2` Nullable(Decimal(18, 4)),
    `param_str1` Nullable(String),
    `param_str2` Nullable(String),
    `param_str3` Nullable(String),
    `num_in_pack` UInt16,
    `num_in_client` UInt32,
    `time_exec` Decimal(9, 4),
    `answer_status` String,
    `answer` String,
    `request` String,
    `ip` UInt32,
    `id_device` UInt32,
    `social_id` String,
    `level` UInt16,
    `exp` UInt64,
    `money` UInt64,
    `money_delta` Int64,
    `donate` Decimal(9, 2),
    `donate_count` UInt16,
    `days` UInt16,
    `days_active` UInt16,
    `sessions` UInt16,
    `duration` UInt32
)
ENGINE = MergeTree()
PARTITION BY date_partition
ORDER BY id_user
SETTINGS index_granularity = 8192;
CREATE TABLE log_game_loadings
(
    `id` UInt64,
    `time_add` DateTime,
    `time_finish` Nullable(DateTime),
    `deviceId` String,
    `deviceModel` String,
    `graphicsDeviceName` String,
    `graphicsDeviceVendor` String,
    `graphicsDeviceVersion` String,
    `operatingSystem` String,
    `platform` String,
    `unityVersion` String,
    `graphicsMemorySize` UInt32,
    `graphicsShaderLevel` UInt32,
    `maxTextureSize` UInt32,
    `npotSupport` UInt8,
    `processorCount` UInt8,
    `processorType` String,
    `supportedRenderTargetCount` UInt32,
    `supports3DTextures` UInt8,
    `systemMemorySize` UInt32,
    `version` String,
    `network` String,
    `ip` UInt32,
    `supportedAlphaTextures` String
)
ENGINE = MergeTree()
PARTITION BY toYYYYMMDD(time_add)
ORDER BY id
SETTINGS index_granularity = 8192;
CREATE TABLE log_sessions
(
    `date_partition` UInt32,
    `id_user` UInt32,
    `session` UInt32,
    `level` UInt32,
    `time_start` DateTime,
    `time_end` DateTime,
    `money_end` UInt64,
    `spins` UInt32,
    `bets` UInt64,
    `os` UInt8
)
ENGINE = MergeTree()
PARTITION BY date_partition
ORDER BY id_user
SETTINGS index_granularity = 8192;
CREATE TABLE stats_users_info
(
    `id` UInt32,
    `date_register` DateTime,
    `os` UInt16,
    `os_init` UInt16,
    `source_type` String
)
ENGINE = TinyLog();
EOSQL
