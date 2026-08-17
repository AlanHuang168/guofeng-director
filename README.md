# guofeng-director

中文文档 | [English](README.en.md)

`guofeng-director` 是一套「古风国漫视觉导演」AI Agent Skill，用于生成结构化、可审计、可直接复制使用的图像提示词。

它面向古风国漫画面创作，重点解决角色清晰、参考图一致、双人互动稳定、风格路由明确和提示词结构可审计的问题。

## 项目定位

本 Skill 重点支持三条视觉路线：

- `逆仙黑暗`: 冷峻、孤独、压抑、高对比、巨物压迫、天劫、崩塌天门。
- `斗破热血`: 少年感、火焰、异火、能量爆发、战斗海报、成长突破。
- `古风国漫通用`: 清丽、仙气、电影感、通透光影、情绪表达、古风角色与场景。

## 核心能力

- 从简短想法扩展为完整古风国漫提示词。
- 支持 `逆仙黑暗` / `斗破热血` / `古风国漫通用` 风格路由。
- 强调人物正面清晰、表情可读、手部和服饰结构稳定。
- 支持参考图驱动的角色一致性。
- 支持双人互动，例如牵手、对视、护持、并肩、对峙。
- 使用 `人物优先级：高 / 中 / 低` 控制角色占比，不再默认把人物压成极小尺度点缀。
- 输出结构固定，便于审计和复用。
- 兼容 Codex、Claude、Grok、Kimi、MiniMax、Seedance、Workbuddy、Catpaw 等平台。

## 设计特点

本项目采用规则驱动的视觉导演流程：

- 按需加载 references（Conditional reference loading）。
- Parameter lock。
- Route-based rule inheritance。
- Structured output。
- Final audit before response。

核心设计重点：

- 将“人物清晰度”提升为共享总则。
- 正面或三分之二正面人物成为高优先级角色的默认方向。
- 参考图一致性拥有独立规则。
- 双人互动成为一等构图类型。
- 人物占比由 `人物优先级` 控制，而不是固定作为环境尺度点。
- 新增 `SYSTEM_PROMPT.md`，可直接复制给国内模型和 Grok 使用。

## 演示图

以下为 `逆仙黑暗` 路由示例：双人正面清晰、牵手互动稳定、崩塌巨型天门与雷劫压迫，冷蓝灰主色配少量血红点睛。

![逆仙黑暗 · 双人正面牵手海报](assets/demo/nixian-dark-couple-frontal.jpg)

![逆仙黑暗 · 双人牵手走向崩塌天门](assets/demo/nixian-dark-couple-gate.jpg)

> `斗破热血` 与 `古风国漫通用` 路由的示例图后续补充。

## 目录结构

```text
guofeng-director/
├── README.md
├── README.en.md
├── SKILL.md
├── SYSTEM_PROMPT.md
├── assets/
│   └── demo/
├── agents/
│   └── openai.yaml
├── scripts/
│   └── check-sync.sh
└── references/
    ├── master-rules.md
    ├── style-routes.md
    ├── character-rules.md
    ├── composition-light.md
    └── negative.md
```

## Codex 使用方式

将本目录放到 Codex 可加载 Skill 的位置，然后显式调用：

```text
使用 $guofeng-director
风格路由：逆仙黑暗
人物优先级：高
画幅比例：16:9
参考图：使用我提供的两张角色图

王林与李慕婉正面牵手，站在崩塌的巨型天门前，两人面向镜头，背景是被雷劫撕裂的苍穹。
```

## 其他模型使用方式

Kimi、MiniMax、Seedance、Workbuddy、Catpaw、Grok 等平台可直接复制 [SYSTEM_PROMPT.md](SYSTEM_PROMPT.md) 的完整内容，作为系统提示、自定义指令或 Agent 角色设定。

然后用类似格式发起请求：

```text
风格路由：斗破热血
人物优先级：高
画幅比例：4:5
人物：一名黑衣少年，正面半身，右手托起青蓝异火
场景：远处沙漠城墙被火浪照亮
输出：标准结构化提示词
```

## 标准输出格式

默认输出：

1. `参数锁定`
2. `视觉导演方案`
3. `完整提示词`
4. `负面约束`
5. `可衍生方向`

如果只需要提示词，可在请求中写 `只要提示词`。

## 维护说明：规则真源

规则存在两个必须保持一致的载体：

- `references/*.md`：**规则真源**（英文、详细），由 Skill 按 `SKILL.md` 的加载策略按需加载。
- [SYSTEM_PROMPT.md](SYSTEM_PROMPT.md)：**派生的中文压缩版**，供无法加载文件的平台整段粘贴使用。

修改规则时，先改 `references/`，再同步到 `SYSTEM_PROMPT.md`。其中负面约束字段是语言中立的，两个文件必须逐字一致。提交前运行漂移校验脚本：

```bash
scripts/check-sync.sh
```

## 开源协议

本项目使用 MIT License 开源，详见 [LICENSE](LICENSE)。

仓库只保留 Skill 指令、规则文件和必要元数据。运行缓存、日志、生成产物、本地环境文件和密钥已通过 [.gitignore](.gitignore) 排除。
