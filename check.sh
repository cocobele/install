check(){
//检查是否屏蔽了交互提示
count=$(grep -c '#alias' /root/.bashrc)
if [ count -le 3 ]; then
echo -e "未屏蔽交互提示";
fi
}