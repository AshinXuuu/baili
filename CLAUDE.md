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
| 007 | 创新者窘境 Innovator's Dilemma | Clay Christensen | 1997 | 商业战略 | `lessons/007-innovators-dilemma.html` | ✅ |
| 008 | 凯利公式 Kelly Criterion | John Kelly | 1956 | 数学·决策 | `lessons/008-kelly-criterion.html` | ✅ |
| 009 | 米尔格拉姆服从实验 | Stanley Milgram | 1961 | 心理·伦理 | `lessons/009-milgram-obedience.html` | ✅ |
| 010 | 香农熵 Shannon Entropy | Claude Shannon | 1948 | 信息论 | `lessons/010-shannon-entropy.html` | ✅ |
| 011 | 沉没成本谬误 Sunk Cost Fallacy | 行为经济学派 | 1985 | 行为经济 | `lessons/011-sunk-cost-fallacy.html` | ✅ |
| 012 | 邓宁-克鲁格效应 Dunning-Kruger | Dunning & Kruger | 1999 | 心理 | `lessons/012-dunning-kruger.html` | ✅ |
| 013 | 汉隆剃刀 Hanlon's Razor | 民间格言 | 20c | 判断·人际 | `lessons/013-hanlons-razor.html` | ✅ |
| 014 | 奥卡姆剃刀 Occam's Razor | William of Ockham | 14c | 哲学·科学 | `lessons/014-occams-razor.html` | ✅ |
| 015 | Lollapalooza Effect | Charlie Munger | 1995 | 投资·心理 | `lessons/015-lollapalooza.html` | ✅ |

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
| 7 | 007 | 创新者窘境 Innovator's Dilemma | Clay Christensen | 1997 | 商业战略 | ✅ |
| 8 | 008 | 凯利公式 Kelly Criterion | John Kelly | 1956 | 数学·决策 | ✅ |
| 9 | 009 | 米尔格拉姆服从实验 | Stanley Milgram | 1961 | 心理·伦理 | ✅ |
| 10 | 010 | 香农熵 Shannon Entropy | Claude Shannon | 1948 | 信息论 | ✅ |
| 11 | 011 | 沉没成本谬误 | 行为经济学派 | 1985 | 行为经济 | ✅ |
| 12 | 012 | 邓宁-克鲁格效应 | Dunning & Kruger | 1999 | 心理 | ✅ |
| 13 | 013 | 汉隆剃刀 Hanlon's Razor | 民间格言 | 20c | 判断·人际 | ✅ |
| 14 | 014 | 奥卡姆剃刀 Occam's Razor | William of Ockham | 14c | 哲学·科学 | ✅ |
| 15 | 015 | Lollapalooza Effect | Charlie Munger | 1995 | 投资·心理 | ✅ |
| 16 | 016 | 帕累托法则 80/20 | Vilfredo Pareto | 1896 | 管理·分布 | ⏳ 下一篇 |
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

最后更新：2026-06-15（№015 Lollapalooza 效应 · Charlie Munger 1995，投资·心理，文件 `lessons/015-lollapalooza.html`。立骨"多力共振/非线性叠加"——Lollapalooza 不是一种新偏差，而是偏差之间的化学反应：几股心理倾向同向汇合时，效果相乘而非相加，突破临界产生极端后果（一根稻草压不垮骆驼，几根同点同时落则塌）。缘起 1995 哈佛法学院演讲《人类误判心理学》，最终修订为二十五条收录《穷查理宝典》2005，Lollapalooza Tendency 列为第25条；lollapalooza=19c 美国俚语"非同寻常之大物"。原典引第25条定义 + 配套主张"手里只有锤子看什么都像钉子"→需多元思维模型格栅（latticework）。释义用"雪崩"+"直播间抢购五只手同时推"双譬喻，重锤"描述机制非清单——越是毫无疑问越要数有几只手"。后人之论四家：西奥迪尼《影响力》1984 六武器（互惠/承诺一致/社会认同/喜好/权威/稀缺，高手叠加同时发力＝微观引擎，芒格送其一股伯克希尔致谢）、卡尼曼行为经济（实验室隔离测单个偏差 vs 现实从不单独行动，芒格补的正是"它们会一起推"）、巴菲特实战印证（硬币另一面＝找良性共振：品牌/规模/网络/习惯叠加成护城河，可乐喜诗）、菲利普·安德森《多者异也》More Is Different 1972（涌现＝Lollapalooza 的科学远亲，水分子不湿但聚合即生湿）。案例五：①可口可乐＝芒格1996哈佛同学聚会"格罗茨饮料/关于实际问题的实际思考"假想（条件反射+糖咖啡因奖励剥夺+铺货可得性+社会认同叠加＝设计出来的良性共振）②公开喊价拍卖"别去拍卖会"（社会认同+承诺一致+剥夺超级反应→赢家诅咒，对策物理撤离）③特百惠聚会（喜好+互惠+社会认同+承诺，西奥迪尼记述，差的就是共振场）④琼斯敦惨案1978圭亚那人民圣殿教吉姆·琼斯九百余人氰化物集体死（绝对权威+极端社会认同+承诺一致+信息隔绝＝至暗版本，芒格常以邪教为例＝保命课）⑤2008金融危机（激励扭曲+社会认同+权威误信AAA+心理否认层层叠加，每个参与者都觉得自己没错＝制度级共振）。反例五条诚实写——①只能事后解释难事前预测（无公式无阈值＝解释眼镜非预测机器、不可证伪）②边界模糊易成万能叙事（什么不是Lollapalooza？稀释解释力）③二十五条非严谨分类学（芒格自承业余、条目重叠、俚语非操作化定义）④共振未必坏=框架偏负面（也能造伟大文化复利护城河，机制中性看方向）⑤知道未必挡得住（当下意志难扳回理性，解药是事前清单+物理躲开＝诊断强于治疗）。连接：西奥迪尼六武器（微观母矿）/多元思维模型（同源方法论）/社会认同（核心组件）/米尔格拉姆№009（权威倾向实例，内链）/承诺与一致·沉没成本№011（核心组件，内链）/涌现 More Is Different（科学远亲）/临界点引爆点（阈值机制）/心理否认（核心组件）。致用5：决策投资"所有信号齐刷刷同向且异常兴奋→疑共振用清单拆"、产品营销"多股力量叠加但守'帮人做对vs让人后悔'底线"、防御反操纵"突然非买不可→数手→物理撤离"、组织文化"激励榜样仪式归属同向＝正向飞轮，坏文化同理"、自我临界"重大失误是几个小压力叠到临界→提前设断点"。延伸阅读：《穷查理宝典》2005、《人类误判心理学》1995演讲、西奥迪尼《影响力》1984、Tren Griffin《Charlie Munger: The Complete Investor》2015、Anderson "More Is Different"(Science 1972)、维基。内链已加 009/011，翻页 014→015 已接、015 NEXT 待明日。已用人物名单新增：芒格/西奥迪尼/卡尼曼/巴菲特/安德森/吉姆·琼斯，后续勿重复。下一篇 016 帕累托法则 80/20 · Vilfredo Pareto 1896，管理·分布；候选：帕累托意大利土地80%归20%人口观察、约瑟夫·朱兰"关键少数vs琐碎多数"质量管理、幂律/长尾/齐夫定律关联、反例可写"80/20是经验规律非定律/比例随意套用/忽略长尾价值"——人物勿与已写重复。）

——历史更新存档——
2026-06-12（№014 奥卡姆剃刀 Occam's Razor · William of Ockham 约1287–1347/14世纪，哲学·科学方法，文件 `lessons/014-occams-razor.html`。立骨"节约原则非最少原则"——剃掉的是"多余实体/假设"非"细节"，是启发式非证明工具，"简单者优先被采纳但优先不等于真"。缘起：奥卡姆唯名论旗手（只有具体个体真实、共相只是名称），因主张教会清贫被教皇约翰二十二世逐出教会流亡巴伐利亚；考据点明"entia non sunt multiplicanda"非奥卡姆原话、由17c约翰·庞奇总结，奥卡姆本人常用"Frustra fit per plura quod potest fieri per pauciora"与"Pluralitas non est ponenda sine necessitate"。释义用医学院"听到马蹄声先想到马而非斑马"+砸车窗小偷例，重锤纠正最常见误读"剃刀针对假设数量非字面长度"（"上帝伪造化石"一句话却含巨大不可检验假设 vs 进化论繁复但每环可检验）。后人之论四家：牛顿《原理》推理规则一"自然不做徒劳之事"、爱因斯坦护栏"尽可能简单但不能过于简单"（防简约滑向简陋）、波普尔可证伪性辩护（简单理论禁止更多、信息含量更高、更勇于被反驳）、所罗门诺夫算法概率/MDL/柯氏复杂度/贝叶斯奥卡姆因子（机器学习防过拟合的数学骨架）。案例四（科学裁决型）：哥白尼日心说削减本轮（诚实补充哥白尼自己仍用本轮、真正简化待开普勒椭圆）、拉瓦锡氧化说取代燃素说（燃素需"负重量"古怪补丁）、迈克尔逊-莫雷1887测不出以太风→1905相对论剃除以太（"测不到又不必要"=剃刀猎物，非证伪而是证明不需要）、机器学习过拟合（九次多项式穿过十点却泛化崩、正则化/先验/MDL给复杂度上税）。反例五条诚实写——①最简未必最真（世界本就复杂、爱因斯坦护栏）②"简单"无客观定义（取决于从哪个框架数起、换语言换单位简单度就变=最深哲学软肋）③会扼杀必要新实体（泡利中微子、孟德尔基因当年若挥剃刀就扼杀真理）④易滑向简陋（"穷因懒"省掉的是结构性原因）⑤与汉隆剃刀的张力（同族择简、但当简单与善意分道时给不同偏向；剃刀给起点假设非终审）。连接：汉隆剃刀（同族/特例）、波普尔可证伪性（现代辩护）、柯氏复杂度/MDL（数学化身）、贝叶斯（奥卡姆因子内在机制）、过拟合（违反代价）、唯名论（思想源头）、查同反剃刀 Walter Chatton（对立补丁：实体不足须增设）。致用5：判断"马蹄声先想到马"、产品工程"每多一组件多一处会坏"、写作删不承担解释的修饰、决策警惕长假设链、自我用剃刀挑指向可改变之处的简单解释。延伸阅读：奥卡姆《Summa Logicae》、牛顿《原理》1687、波普尔《科学发现的逻辑》1934、Elliott Sober《Ockham's Razors: A User's Manual》2015、David MacKay《Information Theory...》2003第28章奥卡姆因子、维基。下一篇 015 Loll-apalooza Effect · Charlie Munger 1995，投资·心理；候选：芒格南加州大学法学院演讲/《穷查理宝典》、多重心理倾向叠加产生极端非线性结果（lollapalooza=多力共振）、与可口可乐/拍卖/邪教/传销案例、与确认偏误/社会认同/激励等"人类误判心理学25条"关联，反例可写"事后归因/难证伪/边界模糊"——人物勿与已写重复。）

——历史更新存档——
2026-06-11（№013 汉隆剃刀 Hanlon's Razor · 民间格言/罗伯特·汉隆 1980，判断·归因心理，文件 `lessons/013-hanlons-razor.html`。出处用阿瑟·布洛克《墨菲定律·第二册》1980 收录宾州斯克兰顿读者 Robert J. Hanlon 投稿"Never attribute to malice that which is adequately explained by stupidity"，形式仿奥卡姆剃刀。原典逐字拆三层限定 adequately/stupidity（广义含无能疏忽匆忙信息不全）/malice（预见伤害且故意，举证责任最高），立骨"归因的节俭原则=愚蠢存量远大于精心策划的恶"。缘起埋两先声：歌德《少年维特的烦恼》1774"误解与疏忽之祸不亚于狡诈与恶意"、海因莱因《Logic of Empire》1941。后人之论四家：Jargon File/埃里克·雷蒙德黑客文化（先查bug再查阴谋）、李·罗斯基本归因错误1977（剃刀=反FAE处方）、伯纳德·英厄姆"搞砸理论 cock-up theory"政治史观、格雷定律 Grey's Law"足够高级的无能与恶意无法区分"（逆向补丁=解释动机不豁免后果）。案例五：火星气候轨道器1999单位换算英制/公制烧毁$3.27亿（蠢非坏）、黑死病投毒指控1348-49犹太人被屠（把瘟疫无知误读为恶意，反方向悲剧）、9·11情报失灵2004委员会"想象力失败+系统失灵"非内部阴谋、一战克拉克《梦游者》2012、敌意归因偏差 Kenneth Dodge 1980起（攻击性儿童把模糊意图读成故意针对）。反例五条诚实写——①有时真是恶意（种族灭绝/麦道夫/PUA不可用愚蠢开脱）②愚蠢也是万能筐（掩盖结构性"理性的恶"）③被坏人当挡箭牌（蓄意伪装成无心）④解释动机≠豁免责任（过失本身可归责）⑤格雷定律：对受害者蠢与坏等价。正确用法=举证顺序非最终判决，"重复发生+对方得利+明知故犯"三件套则升级为恶意。连接：奥卡姆剃刀（同族）/基本归因错误（上游）/敌意归因偏差（对应病态）/确认偏误（放大器）/善意原则（哲学对应）/搞砸理论（宏观）/格雷定律（逆向）/道德运气（动机vs后果张力）。致用5：人际先补三个无恶意解释、管理戴明85/15查系统、网络别上升到坏、自我"别人没把你放心上"、边界守失效线。下一篇 014 奥卡姆剃刀 Occam's Razor · William of Ockham 14c，哲学·科学；候选：奥卡姆原文"如无必要勿增实体（实体不应被不必要地增多）"、与汉隆剃刀同族对照（择简/择善）、科学方法节俭原则、与爱因斯坦"尽可能简单但不过于简单"关联，反例可写"最简未必最真/过度简化"——人物勿与已写重复。）

——历史更新存档——
2026-06-10（№012 邓宁-克鲁格效应 Dunning-Kruger · Justin Kruger & David Dunning 1999，心理·元认知，文件 `lessons/012-dunning-kruger.html`。缘起用麦克阿瑟·惠勒1995柠檬汁抢银行（邓宁读报得灵感）。原典用康奈尔1999《Unskilled and Unaware of It》(JPSP 77(6))：幽默/逻辑/语法三测、底部四分之一(约12百分位)自评约62百分位；核心立骨"双重负担double burden——做对的知识=判断自己做没做对的知识，同一套，故无能同时挡住能力与对无能的觉察"；尾巴"高手轻微低估自己=错误共识"。开篇引达尔文《人类的由来》1871"无知比博学更易生自信"。后人之论四家：邓宁本人《We Are All Confident Idiots》2014(未知的未知)、Krueger&Mueller 2002(回归均值+优于平均的统计假象批评，注意此Krueger非作者Kruger)、克兰斯&艾姆斯1978冒名顶替综合征(镜像)+罗素名言、尼科尔斯《专家之死》2017反专家心态。案例五：惠勒柠檬汁(1995)、康奈尔实验(1999，12%→62%)、斯文森1981美国93%司机自评高于中位数(优于平均)、Barber&Odean《交易有害你的财富》2000散户过度自信交易越多亏越多、Motta等2018自闭症疫苗议题知识最少者最觉得"比医生更懂"。反例五条诚实写——①网传"愚昧之巅"曲线是迷因不在原论文②可能只是统计假象(Krueger&Mueller 2002 / Gignac&Zajenkowski 2020 回归均值+噪声)③受文化情境影响(东亚偏自谦或反转)④"优于平均"也许才是主因⑤别当骂人标签(断言无知者最自信本身也可能是自信的无知)。连接：元认知(上游)/优于平均效应/确认偏误/冒名顶替综合征(镜像)/回归均值(统计批评)/自我服务偏差/苏格拉底无知之知(哲学先声)。下一篇 013 汉隆剃刀 Hanlon's Razor · 民间格言，判断·人际；候选：罗伯特·汉隆/Jargon File出处、"能用愚蠢解释的别归于恶意"、与基本归因错误/敌意归因偏差关联，反例可写"有时确实是恶意/对系统性作恶不适用"——人物勿与已写重复。）

——历史更新存档——
№011 沉没成本谬误 Sunk Cost Fallacy · 行为经济学派，奠基 Arkes & Blumer 1985。原典用 Arkes&Blumer《The Psychology of Sunk Cost》(OBHDP 1985) 的滑雪票实验（100美元密歇根 vs 50美元威斯康星，多数选更贵更无趣的）；核心立骨"沉没成本不是成本而是历史""决策只看未来边际收益+机会成本"。别名协和谬误（Dawkins《自私的基因》1976 借用）。后人之论四家：塞勒心理账户（1980 最早列 sunk cost effect / 2017 诺奖）、卡尼曼-特沃斯基前景理论损失厌恶（1979）、斯托承诺升级《泥潭深陷》(1976)、道金斯协和谬误生物学版。案例五：协和客机(1962-2003，~11亿英镑)、越战升级(约翰逊政府/鲍尔泥潭警告)、阿克斯剧院季票田野实验(全价者上半季出席更多、下半季效应消失)、赌徒追逐损失/套牢补仓、烂片烂书烂关系日常版。反例五条诚实写——①有时坚持非谬误(未来收益仍为正)②信誉/承诺有真实价值③沉没成本可作承诺装置(预付费健身卡)④效应非铁律(受框架/时间/文化影响、阿克斯下半季消失)⑤"止损"可能被滥用为逃避借口。连接：损失厌恶/前景理论/承诺升级/心理账户/机会成本/禀赋效应/承诺与一致(西奥迪尼)/现状偏好。下一篇 012 邓宁-克鲁格效应 Dunning-Kruger · Justin Kruger & David Dunning 1999，心理；候选：康奈尔1999《Unskilled and Unaware of It》(JPSP)原始研究、"无知者最自信"双重负担(double burden)、四象限自信-能力曲线、元认知缺陷、与确认偏误/自我服务偏差关联，反例可写"曲线被夸大/统计假象(回归均值+Better-than-average 混入)"诚实写——人物勿与已写重复。）

——历史更新存档——
№010 香农熵 Shannon Entropy · Claude Shannon 1948，信息论·通信。原典用 1948《通信的数学理论》定义 H=−Σp·log p（比特）+ 冯·诺依曼"叫它熵"命名轶事；核心立骨"信息=不确定性的消除""熵度量惊奇而非意义"。后人之论四家：维纳《控制论》负熵/"信息就是信息"、韦弗三层次（技术/语义/效果）、杰恩斯最大熵原理（统计力学从信息论重导）、兰道尔原理 kT·ln2 解麦克斯韦妖。案例五：摩尔斯电码频率直觉、哈夫曼编码（学生胜法诺1951）、香农印刷英语熵≈1bit/75%冗余、旅行者号纠错码逼近信道容量、LLM交叉熵/困惑度"压缩即智能"。反例五诚实写——①熵≠意义（随机噪声熵最高）②需已知分布③与热力学熵形似须谨慎④只管平均不管个体（柯氏复杂度补）⑤信源/字母表须良定义。连接：热力学熵/柯尔莫哥洛夫复杂度/兰道尔/互信息/KL散度交叉熵/最大熵/贝叶斯/奥卡姆剃刀。下一篇 011 沉没成本谬误 Sunk Cost Fallacy，行为经济，候选：协和谬误 Concorde fallacy、Arkes&Blumer 1985 实验、"机会成本才是真成本"、与损失厌恶/承诺升级 escalation of commitment 关联，反例可写"有时坚持非谬误"——注意与已写理论勿重复人物。）

——历史更新存档——
№009 米尔格拉姆服从实验 Stanley Milgram 1961，心理·伦理；耶鲁电击装置（15→450伏、四句中性催促、65%加到450伏）+ "代理状态"概念；后人之论用阿伦特"平庸之恶"/鲍姆林德伦理批判/津巴多情境主义/吉娜·佩里档案祛魅四家；案例：20余变体（同伴反抗降至10%）、101后备警察营《普通人》、伯格2009部分复制70%、法国《死亡游戏》80%；反例五条诚实写——伦理、65%是被挑数字、被试疑电击为假、实验员脱稿、Haslam&Reicher"投入的追随"挑战盲目服从说。下一篇 010 香农熵 Shannon Entropy · Claude Shannon 1948，信息论，候选：《通信的数学理论》原文、熵公式 H=−Σp·log p、信息=消除不确定性、与热力学熵的类比与区别、数据压缩/纠错码应用 + "熵不是含义而是惊奇度"的常见误解作反例）
