#dos2unix filename

set -e

installPath=/var/GeoMxNGSPipeline
overrideSettings=false
overrideRuntimesettings=false
systemPath=/etc/systemd/system
outputPath=GeoMxNGSPipeline
firstInstall=true
tmpPath=/var/tmp/.net

if [ ! -d $installPath ]; then
  sh -c "echo 'export PATH=\$PATH:$installPath' >> /etc/profile"
  export PATH=$PATH:$installPath
fi

if [ ! -d $tmpPath ]; then
  mkdir -p $tmpPath
fi

if [ -d $outputPath ]; then
  rm -r $outputPath  
fi

mkdir $outputPath
tar -C $outputPath -zxf GeoMxNGSPipeline.tgz

if [ -d $installPath ]; then
  firstInstall=false
  echo "GeoMxNGSPipeline API already installed. Do you want to override settings? [Y or y to override settings]"
  read override
  if [ "$override" = "y" ] || [ "$override" = "Y" ]; then
    overrideSettings=true
  fi
else
  firstInstall=true
  mkdir -p $installPath
  overrideSettings=false
fi

if [ ! -r $systemPath/GeoMxNGSPipeline.service ]; then 
  cp $outputPath/GeoMxNGSPipeline.service $systemPath
else
  cp -f $outputPath/GeoMxNGSPipeline.service $systemPath
fi

#systemctl daemon-reload

if [ ! -r $installPath/restsettings.json ]; then
  cp $outputPath/restsettings.json $installPath
fi

if [ ! -r $installPath/runtimesettings.xml ]; then
  cp $outputPath/runtimesettings.xml $installPath
fi

if [ $overrideSettings = true ] || [ $firstInstall = true ]; then
  # Change port
  echo "Please provide port (Default 5000):"
  read port
  if [ -z "$port" ]; then 
    port=5000
  fi
  sed -i "s/\"Port\": \".*\"/\"Port\": \"$port\"/" $outputPath/restsettings.json 
  cp -f $outputPath/restsettings.json $installPath

  if [ $overrideSettings = true ]; then
    # Override runtimesettings
    echo "Override runtimesetting.xml? [Y or y to override runtimesetting.xml]"
    read overrideRuntimesettings
    if [ "$overrideRuntimesettings" = "y" ] || [ "$overrideRuntimesettings" = "Y" ]; then
      cp -f $outputPath/runtimesettings.xml $installPath
    fi 
  fi
fi

chmod -R 777 $tmpPath
chmod 777 $installPath
chmod 755 $outputPath/GeoMxNGSPipeline_API
chmod 755 $outputPath/geomxngspipeline
chmod 755 $outputPath/agreement_cli.txt

export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

cp -f $outputPath/GeoMxNGSPipeline_API $installPath
cp -f $outputPath/geomxngspipeline $installPath
cp -f $outputPath/agreement_cli.txt $installPath

#systemctl start GeoMxNGSPipeline.service
#systemctl enable GeoMxNGSPipeline.service

rm -r $outputPath

echo "Installation completed successfully."
