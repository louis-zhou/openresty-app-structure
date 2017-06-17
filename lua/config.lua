local os_env = os.getenv
local env_conf_value = os_env('ENV_CONF_VALUE')
local env_config = require ("conf.".. env_conf_value ..".config")

local base_config = {
	

}
return setmetatable(env_config, base_config)