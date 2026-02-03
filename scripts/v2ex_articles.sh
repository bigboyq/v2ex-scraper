#!/bin/bash
# 从 V2EX 指定板块获取文章标题和链接
# 用法: v2ex_articles.sh [category] [count]
# 输出格式: - [标题](链接)

CATEGORY=${1:-default}
COUNT=${2:-5}
BASE_URL="https://www.v2ex.com"

# 根据分类映射 URL
case "$CATEGORY" in
    "hot")
        URL="${BASE_URL}/?tab=hot"
        ;;
    "tech")
        URL="${BASE_URL}/?tab=tech"
        ;;
    "r2")
        URL="${BASE_URL}/?tab=r2"
        ;;
    "apple")
        URL="${BASE_URL}/?tab=apple"
        ;;
    "default"|"latest")
        URL="${BASE_URL}"
        ;;
    *)
        URL="${BASE_URL}"
        ;;
esac

# 抓取逻辑优化
# 1. grep 提取包含 item_title 的 span 所在的整行
# 2. sed 正则匹配 href 和 标题内容，并拼接成 Markdown 链接格式
#    格式： - [标题](https://www.v2ex.com/t/xxxx)

curl -s -A "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)" "$URL" | \
 grep -oP '<span class="item_title">.*?</span>' | \
 sed -E 's#.*<a href="([^"]+)".*>(.*)</a>.*#- [\2]('"${BASE_URL}"'\1)#' | \
 head -n "$COUNT"
