#!/bin/bash
MAGICAL_NUMBER=$(( 1 + $RANDOM % 100 ))
REGULAR_EXPRESSION="^[0-9]+$"

echo "Добро пожаловать в игру "Угадай число""
echo -n "Введите число:"
read ANSWER


while ! [ "$ANSWER" = "$MAGICAL_NUMBER" ]
do
	echo -n "Введите число:"
	read ANSWER

	if ! [[ "$ANSWER" =~ $REGULAR_EXPRESSION ]]; then # регулярные выражения в кавычки не брать! Не работает (да и не за чем)
		echo "Не, "$ANSWER" не число"
		continue
	fi

	if [ $ANSWER -ge $MAGICAL_NUMBER ]; then
		echo "Неправльно, попробуй ещё раз (загаданное число меньше)"
		continue
	else
		echo "Неправльно, попробуй ещё раз (загаданное число больше)"
		continue
	fi

done

echo "Верно!\n Вы угадали загаданное число: $ANSWER"

