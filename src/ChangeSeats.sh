#!/usr/bin/env bash
set -Ceu
#---------------------------------------------------------------------------
# TSVの行順序を入れ替える（席替え）。
# CreatedAt: 2020-09-25
#---------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$HERE";
	. "$APP_ROOT/lib/Error.sh"
	Help() { eval "echo \"$(cat "$APP_ROOT/doc/help.txt")\""; }
	while getopts :m: OPT; do
		case $OPT in
			m) ARG_METHOD="$OPTARG"; continue; ;;
			*) Help; exit 1; ;;
		esac
	done
	NAME_LIST="$(cat -)"
	ARG_METHOD="${ARG_METHOD:-n}"
	CheckArgs() {
		IsMethod() {
			case "${ARG_METHOD,,}" in
				n|number) ;;
				r|random) ;;
				a|alternate) ;;
				*) Throw '引数 m の値は n r a のいずれかであるべきです。' ;;
			esac
		}
		IsNameList() {
			[ '' = "$NAME_LIST" ] && { Throw '標準入力に名簿データがありません。TSV形式で出席番号、名字読み、名前読み、名字表記、名前表記、性別、の6列を持った形式で渡してください。'; }
			echo -n '';
		}
		IsMethod
		IsNameList
	}
	CheckArgs
	ChangeForNumber() { echo -e "$NAME_LIST" | sort -n -t$'\t' -k1; }
	ChangeForRandom() { echo -e "$NAME_LIST" | shuf; }
	ChangeForAlternate() {
		LIST_M="$(echo -e "$NAME_LIST" | awk -F "\t" '$6=="m"')"
		LIST_F="$(echo -e "$NAME_LIST" | awk -F "\t" '$6=="f"')"
		LIST_NUM_M=$(echo -e "$LIST_M" | wc -l)
		LIST_NUM_F=$(echo -e "$LIST_F" | wc -l)
		MF() { paste -d$'\n' <(echo -e "$LIST_M" | shuf) <(echo -e "$LIST_F" | shuf) | sed '/^$/d'; }
		FM() { paste -d$'\n' <(echo -e "$LIST_F" | shuf) <(echo -e "$LIST_M" | shuf) | sed '/^$/d'; }
		[ $LIST_NUM_F -eq $LIST_NUM_M ] && {
			[ 0 -eq $((RANDOM % 2)) ] && { MF; } || { FM; }
		} || {
			[ $LIST_NUM_F -lt $LIST_NUM_M ] && { MF; } || { FM; }
		}
	}
	case "${ARG_METHOD,,}" in
		n|number) ChangeForNumber;;
		r|random) ChangeForRandom;;
		a|alternate) ChangeForAlternate;;
	esac
}
Run "$@"
