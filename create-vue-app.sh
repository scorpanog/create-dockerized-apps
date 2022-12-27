#!/bin/sh

echo Project name?
read input_directory

echo Port number?
read port_number

directory="../$input_directory"

if [[  -e $directory ]]; then
	rm -rf $directory
fi

mkdir $directory

cd $directory

mkdir app

docker run --rm -v "${PWD}:/$(basename `pwd`)" -w "/$(basename `pwd`)" -it dockerized-vue sh -c "vue create --inlinePreset  '{ \
\"useConfigFiles\": false,\
  \"plugins\": {\
    \"@vue/cli-plugin-babel\": {}\
  },\
  \"vueVersion\": \"3\",\
  \"router\": true,\
  \"routerHistoryMode\": true,\
  \"vuex\": true\
}' -f app"

touch run.sh

echo "docker run --rm -d -v \"${PWD}/app:/app\" \
  -p $port_number:$port_number \
  -w \"/app\" \
  --name \"$input_directory\" \
  -it dockerized-vue sh -c \"PORT=$port_number yarn serve\"" >> run.sh

chmod 0755 run.sh