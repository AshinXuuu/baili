# 百里路 · 项目记忆

> 这份文件是项目工作记忆。任何新会话进入这个目录，**先读这份**，再读代码——所有约定、状态、模板、部署都在这里。

---

## 一、项目本质

跨领域的"定理／定律／理论"百科。每篇拆解一个理论。

- **用户**：ashin（ashinxu@yeah.net）
- **形式**：一日一理，覆盖金融、心理、营销、管理、科学、哲学等
- **节奏**：每天 12:30 由 Claude 自动生成下一篇（cron 已配置，与易经的 12:00 错开）
- **总量**：不预设，长期积累

---

## 二、目录与基础设施

### 本地路径
```
/Users/ashin/Desktop/日报/知识/百里路/
├── CLAUDE.md            ← 项目记忆（你正在读）
├── index.html           ← 首页（理论卡片列表 + 分类过滤）
├── deploy.sh            ← 一键发布（commit + push + ssh git pull）
├── .gitignore
├── assets/
│   └── style.css        ← 现代学术风主题 + 移动适配
└── lessons/
    ├── 001-kondratieff.html   ✅ 康德拉季耶夫长波
    └── 002-...html            ⏳ 下一篇待生成
```

### GitHub
- **仓库**：`git@github.com:AshinXuuu/baili.git`（已上线，SSH，public）
- **主分支**：`main`

### 部署
- **服务器**：腾讯云轻量应用服务器，`124.222.164.101`（与易经同一台）
- **SSH 用户**：`ubuntu`（Mac 已 ssh-copy-id 免密）
- **服务器路径**：`/var/www/baili`（与易经 `/var/www/yijing` 平行）
- **Nginx 配**：`/etc/nginx/sites-available/baili.conf`
- **HTTPS**：Let's Encrypt（Certbot 自动续签）
- **公网访问**：https://baili.xxcode.work
- **更新流程**：本地改 → `./deploy.sh "..."` 一键完成

### deploy.sh 配置（已填好）
```bash
SSH_USER="ubuntu"
SSH_HOST="124.222.164.101"
SSH_PORT="22"
REMOTE_PATH="/var/www/baili"
SITE_URL="https://baili.xxcode.work"
```

---

## 三、当前进度（每生成一篇更新这块）

| № | 理论 | 提出者 | 年份 | 领域 | 文件 | 状态 |
|---|---|---|---|---|---|---|
| 001 | 康德拉季耶夫长波 | Kondratieff | 1925 | 金融·经济 | `lessons/001-kondratieff.html` | ✅ |
| 002 | 反脆弱 Antifragility | Nassim Taleb | 2012 | 复杂系统·哲学 | `lessons/002-antifragility.html` | ✅ |
| 003 | 第二序思维 Second-Order Thinking | Howard Marks | 2011 | 决策·投资 | `lessons/003-second-order-thinking.html` | ✅ |
| 004 | 黑天鹅 Black Swan | Nassim Taleb | 2007 | 风险·认识论 | `lessons/004-black-swan.html` | ✅ |
| 005 | 古德哈特定律 Goodhart's Law | Charles Goodhart | 1975 | 管理·指标 | `lessons/005-goodharts-law.html` | ✅ |
| 006 | 库恩范式 Paradigm Shift | Thomas Kuhn | 1962 | 科学哲学 | `lessons/006-paradigm-shift.html` | ✅ |
| 007 | （待定） | | | | `lessons/007-...html` | ⏳ **下一篇** |

**判断下一篇文件名**：
```bash
ls lessons/ | sed -E 's/^([0-9]+).*/\1/' | sort -n | tail -1
# 加 1 得到下一篇编号，3 位数零填充
```

### 推荐顺序（重量级先行，定时任务严格按此表执行）

下一篇就从这里**自上而下**找第一个未完成的，做完后在 CLAUDE.md 标 ✅。
排序逻辑：跨学科影响 × 思想深度 × 实操价值 × 历史地位 — **重量级先行**。

| 日序 | 编号 | 理论 | 提出者 | 年份 | 领域 | 状态 |
|---|---|---|---|---|---|---|
| 1 | 001 | 康德拉季耶夫长波 | Kondratieff | 1925 | 经济·长周期 | ✅ |
| 2 | 002 | 反脆弱 Antifragility | Nassim Taleb | 2012 | 复杂系统·哲学 | ✅ |
| 3 | 003 | 第二序思维 Second-Order Thinking | Howard Marks | 2011 | 决策·投资 | ✅ |
| 4 | 004 | 黑天鹅 Black Swan | Nassim Taleb | 2007 | 风险·认识论 | ✅ |
| 5 | 005 | 古德哈特定律 Goodhart's Law | Charles Goodhart | 1975 | 管理·指标 | ✅ |
| 6 | 006 | 库恩范式 Paradigm Shift | Thomas Kuhn | 1962 | 科学哲学 | ✅ |
| 7 | 007 | 创新者窘境 Innovator's Dilemma | Clay Christensen | 1997 | 商业战略 | ⏳ 下一篇 |
| 8 | 008 | 凯利公式 Kelly Criterion | John Kelly | 1956 | 数学·决策 | 待 |
| 9 | 009 | 米尔格拉姆服从实验 | Stanley Milgram | 1961 | 心理·伦理 | 待 |
| 10 | 010 | 香农熵 Shannon Entropy | Claude Shannon | 1948 | 信息论 | 待 |
| 11 | 011 | 沉没成本谬误 | 行为经济学派 | — | 行为经济 | 待 |
| 12 | 012 | 邓宁-克鲁格效应 | Dunning & Kruger | 1999 | 心理 | 待 |
| 13 | 013 | 汉隆剃刀 Hanlon's Razor | 民间格言 | 20c | 判断·人际 | 待 |
| 14 | 014 | 奥卡姆剃刀 Occam's Razor | William of Ockham | 14c | 哲学·科学 | 待 |
| 15 | 015 | Lollapalooza Effect | Charlie Munger | 1995 | 投资·心理 | 待 |
| 16 | 016 | 帕累托法则 80/20 | Vilfredo Pareto | 1896 | 管理·分布 | 待 |
| 17 | 017 | 邓巴数字 Dunbar's Number | Robin Dunbar | 1992 | 社会学 | 待 |
| 18 | 018 | 海因里希法则 1:29:300 | Herbert Heinrich | 1931 | 安全·风险 | 待 |
| 19 | 019 | 默顿自我实现预言 | Robert Merton | 1948 | 社会学 | 待 |
| 20 | 020 | 帕金森定律 | C. Northcote Parkinson | 1955 | 组织·效率 | 待 |
| 21 | 021 | 达尔文 vs 拉马克进化 | Darwin / Lamarck | 19c | 生物·演化 | 待 |
| — | … | （后续题材见下表，做完上表再开） | | | | |

### 后续题材池（随时补充）

上表 21 条做完后再开。也作为 ad-hoc 备用。

| 候选 | 领域 | 备注 |
|---|---|---|
| Hanlon's Razor 汉隆剃刀 | 心理·判断 | "不要把愚蠢能解释的归结为恶意" |
| Lollapalooza Effect | 投资·心理 | Munger，多重力量叠加 |
| 反脆弱 Antifragility | 复杂系统 | Taleb |
| 第二序思维 Second-Order Thinking | 决策 | Howard Marks |
| 沉没成本谬误 Sunk Cost Fallacy | 行为经济 | 经典认知偏差 |
| 帕累托法则 80/20 | 管理·效率 | Pareto |
| 邓巴数字 Dunbar's Number | 社会学 | 150 人 |
| 海因里希法则 Heinrich's Law | 安全·风险 | 1:29:300 |
| 古德哈特定律 Goodhart's Law | 管理·指标 | 度量即扭曲 |
| 邓宁-克鲁格效应 | 心理 | 无知者最自信 |
| 奥卡姆剃刀 Occam's Razor | 哲学·科学 | 最简解释优先 |
| 黑天鹅 Black Swan | 风险·哲学 | Taleb |
| 默顿规范 / 自我实现预言 | 社会学 | Merton |
| 创新者窘境 | 商业战略 | Christensen |
| 拉马克进化论 vs 达尔文 | 生物·演化 | 对照式讲解 |
| 库恩范式 Paradigm Shift | 科学哲学 | Thomas Kuhn |
| 凯利公式 Kelly Criterion | 投注·风险 | 数学 + 决策 |
| 香农熵 Shannon Entropy | 信息论 | 跨学科基础 |
| 米尔格拉姆服从实验 | 心理·伦理 | 经典实验 |
| 帕金森定律 | 组织·效率 | "工作总会填满时间" |

---

## 四、视觉与风格规范

### 主题：现代极简 · 学术杂志风

- **配色变量**（在 `:root`）：
  - `--bg` 暖米白 `#fafaf7`
  - `--paper` 卡片白 `#ffffff`
  - `--ink` 深炭 `#1a1a1a`
  - `--accent` 砖红 `#b91c1c`
  - `--accent-soft` 浅米黄高亮 `#fef3c7`
  - `--ink-mid` 次级文字 `#4a4a48`
  - `--line` 灰分割线 `#e2dfd6`
- **字体**：黑体栈（中文）+ Georgia（英文衬线，用于编号/小标/书名）
- **阅读宽度**：720px 窄行（学术阅读最佳宽度）

### 已存在的 CSS 类（直接用，不要新发明）
- 头部：`.site-header .brand .logo .logo-en .nav`
- 面包屑：`.breadcrumb .lesson-no`
- Hero：`.lesson-hero .lesson-num .lesson-title .lesson-title-en .lesson-meta .lesson-meta-item`
- 章节：`.section .section-head .sec-num .sec-title .sec-en`
- 原典：`.theorem .theorem-label .theorem-body .theorem-cite`
- 后人之论：`.commentary .commentary-card .comm-author .comm-name .comm-tag`
- 案例：`.cases .case-card .case-meta .case-num .case-title .case-when .case-insight`
- 反例：`.critique-list .critique-item`
- 连接：`.connections .conn-item .conn-name .conn-name-en .conn-rel .conn-desc`
- 致用：`.usage .usage-item .usage-key .usage-text`
- 反观：`.reflect .q`（自带编号 counter）
- 延伸：`.further .further-title .further-meta`
- 内联引用：`.quote-inline`
- 翻页：`.pager`
- 页脚：`.site-footer`
- 首页：`.home-hero .home-title .home-tagline .filter-row .filter-tag .lessons-grid .lesson-card .lc-num .lc-main .lc-name .lc-name-en .lc-meta .lc-author .lc-tag`

⚠️ **不要在 HTML 写内联 font-family**——会和 CSS 已统一的字体冲突。
⚠️ **不要写新 CSS 类**——已有的够用。

### 移动端
`@media (max-width: 720px)` 和 `(max-width: 380px)` 两段已写好，新课无需再写。

---

## 五、每篇内容模板（11 章节，雷打不动）

```
面包屑（href="../index.html" + № N）
Hero：     LESSON N · DOMAIN / 理论名（中） / 英文+副标 / lesson-meta 4 项
一、缘起        ORIGIN — 提出背景、提出者简介
二、原典        THE PRIMARY TEXT — 原作者定义 + .theorem 卡 + 引文出处
三、释义        PLAIN MEANING — 剥去术语后的本意 + 譬喻
四、后人之论    LATER INTERPRETATIONS — 3-4 张 .commentary-card，每个学派一卡
五、案例        CASE STUDIES — 3-5 张 .case-card，每张配 .case-insight
六、反例与限制  CRITIQUE & LIMITS — 4-5 条 .critique-item，编号 ①②③
七、相关理论    CONNECTIONS — 4-8 张 .conn-item，标注关系（因果上游/同体系/互补/对照）
八、致用        APPLICATION — 4-5 条 .usage-item，分类目（资产配置/职业/创业/心理...）
九、反观三问    THREE QUESTIONS — 3 问 .reflect 自带编号
十、延伸阅读    FURTHER READING — 5-6 本/篇 .further 项，配元信息
翻页：上一篇 / HOME / 下一篇
页脚：№ NNN · 理论名 · 毕
```

### 关键内容要求
- **原典**：尽可能引用真实原文，标注年份和书名
- **后人之论**：3-4 位真实学者，每人独立段落，附年份标签
- **案例**：真实历史事件，含具体年份、地点、人物
- **反例**：诚实写理论的局限，不要美化
- **连接**：列出与该理论真实存在关联的其他理论，给关系标签
- **延伸阅读**：必须是真实存在的书籍/论文，外部链接用维基百科或权威源

---

## 六、每生成一篇要做的四件事

1. **新建** `lessons/NNN-key.html`（参考 001-kondratieff.html 结构）
2. **改 index.html 的 .lessons-grid**：在已有 lesson-card 上方插入新卡片（最新在上）
3. **校验**：跑下面的标准检查
4. **更新 CLAUDE.md** 第三节进度表
5. **输出给用户**：简介本篇核心要点 + 部署命令
   ```bash
   cd "/Users/ashin/Desktop/日报/知识/百里路"
   ./deploy.sh "№NNN: 理论名"
   ```

### 标准校验脚本
```bash
cd "/Users/ashin/Desktop/日报/知识/百里路" && python3 << 'PYEOF'
import re, html.parser, os
class V(html.parser.HTMLParser):
    def __init__(self): super().__init__(); self.errors=[]
    def error(self, msg): self.errors.append(msg)
files = ['index.html'] + sorted([f'lessons/{f}' for f in os.listdir('lessons') if f.endswith('.html')])
for f in files:
    p = V()
    with open(f, encoding='utf-8') as fh: t = fh.read()
    p.feed(t)
    broken = re.findall(r'style="[^"]*"[A-Za-z][^>]*"[^>]*"', t)
    print(f, '|', 'ok' if not p.errors else p.errors, '| broken-style:', len(broken))
PYEOF
```

---

## 七、用户偏好

- 喜欢**深度+广度**——每篇都要既能读懂又有真东西
- 喜欢**多家解读+真实案例+诚实反例**——三位一体最有说服力
- 偏好**跨学科连接**——理论不孤立，要织成网
- 喜欢**致用条目可操作**——能反观当下选择
- 黑体 + Georgia 西文衬线
- HTML 用 class，不用内联 style
- 一切发布走 `./deploy.sh`

---

## 八、与"易经"项目的关系

平行项目，独立部署，共享一台服务器：

|  | 易经 | 百里路 |
|---|---|---|
| 目录 | `/Users/ashin/Desktop/日报/知识/易经/` | `/Users/ashin/Desktop/日报/知识/百里路/` |
| 仓库 | `AshinXuuu/yijing` | `AshinXuuu/baili` |
| 服务器路径 | `/var/www/yijing` | `/var/www/baili` |
| 域名 | `yijing.xxcode.work` | `baili.xxcode.work` |
| 定时任务 | 12:00 | **12:30**（错开） |
| 风格 | 古典雅致 | 现代学术 |
| 节奏 | 一日一卦，共 72 课 | 一日一理，长期累积 |

---

最后更新：2026-06-01（№006 库恩范式 Paradigm Shift · Thomas Kuhn 1962）
