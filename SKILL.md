---
name: v2ex-scraper
description: Fetch article titles from V2EX community. Supports filtering by specific categories including Hot, Tech, Apple, R2 (Creative), and the Default homepage. Use this when the user asks for V2EX updates or topics in these specific areas.
---

# V2EX 爬虫

从 V2EX 社区抓取指定板块的文章标题。

## 使用方法

脚本返回 Markdown 格式的列表（`- [标题](链接)`），可直接展示给用户。

```bash
scripts/v2ex_articles.sh [category] [count]
```

## 参数说明
- category: 目标板块，支持以下值：
  - default: 首页/全部 (Default/Latest) - 当用户未指定板块或仅说"看看V2EX"时使用。
  - hot: 最热 (Hot) - 当用户询问热门话题时。
  - tech: 技术 (Tech) - 当用户询问技术、编程、开发相关内容时。
  - r2: 创意/无聊图 (R2/Creative) - 当用户询问创意、生活或 R2 板块时。
  - apple: Apple - 当用户询问 Apple、iPhone、Mac 等苹果相关讨论时。
- count: (可选) 需要获取的文章数量，默认为 5。

## 示例

1. **获取 V2EX 首页内容** (用户: "看看 V2EX 有什么新帖子"):
```bash
scripts/v2ex_articles.sh default 5
```

2. **获取热门技术讨论** (用户: "V2EX 最近有什么技术热点?"):
```bash
scripts/v2ex_articles.sh tech 5
```

3. **关注 Apple 动态** (用户: "V2EX 上关于苹果有啥讨论?"):
```bash
scripts/v2ex_articles.sh apple 10
```

4. **查看全站最热** (用户: "V2EX 现在最火的是什么?"):
```bash
scripts/v2ex_articles.sh hot 5
```
