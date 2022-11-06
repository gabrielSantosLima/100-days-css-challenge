#!/bin/bash
dayNumber=$1

create_day_folder(){
    folderName="day-$1"
    echo "[1..3] Creating challenge with name '$folderName'..."
    if [ -d "$folderName" ] 
    then
        echo "[Error] Directory already exists."
    else
        echo "[2..3] Creating folder with name '$folderName'..."
        mkdir $folderName
        cd $folderName
        echo "[3..3] Creating files..."
        echo "<!DOCTYPE html><html lang=\"pt-br\"><head><meta charset=\"UTF-8\"><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"><style></style><title>Desafio - Dia $1</title></head><body><a href=\"https://100dayscss.com/days/$1\" target=\"_blank\">Clique aqui para acessar o desafio</a></body></html>" > index.html
        touch styles.css
        echo "#!/bin/bash
        npx live-server" > run.sh
        echo "Do you want to open '$folderName' with Visual Studio Code? [y - yes | n - no]:"
        read openWithVSCode
        if [ "$openWithVSCode" = "y" ]
        then
            code .
        fi
        echo "Success."
    fi
}

if [ -n "$dayNumber" ]
then
    create_day_folder $dayNumber
else
    echo "Say the day number."
fi 