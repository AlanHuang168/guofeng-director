# guofeng-director

中文 | [English](#english-version)

`guofeng-director` 是一套「古风国漫视觉导演」AI Agent Skill，用于生成结构化、可审计、可直接复制使用的图像提示词。

它参考了 `xianxia-visual-director` 的规则驱动架构，但重点从“环境巨构仙侠”转向“角色清晰、参考图一致、双人互动稳定、古风国漫画面可控”。

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

## 与 xianxia-visual-director 的关系

本项目保留了原 Skill 的优点：

- Required loading order。
- Parameter lock。
- Route-based rule inheritance。
- Structured output。
- Final audit before response。

主要改造点：

- 将“人物清晰度”提升为共享总则。
- 正面或三分之二正面人物成为高优先级角色的默认方向。
- 参考图一致性拥有独立规则。
- 双人互动成为一等构图类型。
- 人物占比由 `人物优先级` 控制，而不是固定作为环境尺度点。
- 新增 `SYSTEM_PROMPT.md`，可直接复制给国内模型和 Grok 使用。

## 演示图

后续可以把演示图放到仓库中，例如：

```text
assets/demo/
├── nixian-dark-example.png
├── battle-flame-example.png
└── guofeng-romance-example.png
```

然后在这里加入图片：

```markdown
![逆仙黑暗示例](assets/demo/nixian-dark-example.png)
![斗破热血示例](assets/demo/battle-flame-example.png)
![古风国漫通用示例](assets/demo/guofeng-romance-example.png)
```

## 目录结构

```text
guofeng-director/
├── README.md
├── SKILL.md
├── SYSTEM_PROMPT.md
├── assets/
│   └── demo/
├── agents/
│   └── openai.yaml
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

## 开源协议

本项目使用 MIT License 开源，详见 [LICENSE](LICENSE)。

仓库只保留 Skill 指令、规则文件和必要元数据。运行缓存、日志、生成产物、本地环境文件和密钥已通过 [.gitignore](.gitignore) 排除。

## 发布到 GitHub

创建空 GitHub 仓库后，连接本地项目并推送：

```bash
git remote add origin git@github.com:<your-org-or-user>/guofeng-director.git
git push -u origin main
```

如果使用 HTTPS：

```bash
git remote add origin https://github.com/<your-org-or-user>/guofeng-director.git
git push -u origin main
```

## English Version

`guofeng-director` is an AI Agent Skill for directing Chinese guofeng donghua image prompts. It produces structured, auditable, copy-ready prompts for character-forward ancient Chinese fantasy visuals.

The project adapts the rule-driven architecture of `xianxia-visual-director`, but shifts the focus from environment-first celestial scale to clear characters, stable reference-image identity, reliable two-person interaction, and controllable guofeng animation aesthetics.

## Positioning

This Skill supports three visual routes:

- `逆仙黑暗`: cold, lonely, oppressive dark xianxia with high contrast, calamity, ruined heavenly gates, and giant-scale pressure.
- `斗破热血`: youthful action, flame energy, explosive combat, breakthrough moments, and hot-blooded poster composition.
- `古风国漫通用`: elegant guofeng fantasy, clear emotional portraits, luminous atmosphere, and cinematic ancient-style scenes.

## Core Features

- Expands short ideas into complete guofeng donghua prompts.
- Supports dark xianxia, flame-action, and general guofeng style routes.
- Prioritizes clear frontal faces, readable expressions, coherent hands, and structured costumes.
- Supports reference-image-based character consistency.
- Supports two-person interactions such as hand-holding, eye contact, protection, side-by-side poses, and confrontation.
- Uses `人物优先级：高 / 中 / 低` to control character scale, instead of always making people tiny environmental markers.
- Produces structured outputs for easy auditing and reuse.
- Works with Codex, Claude, Grok, Kimi, MiniMax, Seedance, Workbuddy, Catpaw, and similar platforms.

## Relationship To xianxia-visual-director

This project keeps the original strengths:

- Required loading order.
- Parameter lock.
- Route-based rule inheritance.
- Structured output.
- Final audit before response.

Major changes:

- Character clarity is promoted to a master rule.
- Front-facing or three-quarter front faces are the default for high-priority people.
- Reference-image consistency has dedicated rules.
- Two-person interaction is treated as a first-class composition type.
- Character scale is controlled by `人物优先级`.
- `SYSTEM_PROMPT.md` can be copied directly into non-Skill platforms.

## Demo Images

Demo images can be added later, for example:

```text
assets/demo/
├── nixian-dark-example.png
├── battle-flame-example.png
└── guofeng-romance-example.png
```

Then embed them in this README:

```markdown
![Dark xianxia example](assets/demo/nixian-dark-example.png)
![Flame action example](assets/demo/battle-flame-example.png)
![General guofeng example](assets/demo/guofeng-romance-example.png)
```

## Layout

```text
guofeng-director/
├── README.md
├── SKILL.md
├── SYSTEM_PROMPT.md
├── assets/
│   └── demo/
├── agents/
│   └── openai.yaml
└── references/
    ├── master-rules.md
    ├── style-routes.md
    ├── character-rules.md
    ├── composition-light.md
    └── negative.md
```

## Usage In Codex

Place this folder where Codex can load Skills, then invoke it explicitly:

```text
使用 $guofeng-director
风格路由：逆仙黑暗
人物优先级：高
画幅比例：16:9
参考图：使用我提供的两张角色图

王林与李慕婉正面牵手，站在崩塌的巨型天门前，两人面向镜头，背景是被雷劫撕裂的苍穹。
```

## Usage On Other Models

For Kimi, MiniMax, Seedance, Workbuddy, Catpaw, Grok, and similar platforms, copy the full content of [SYSTEM_PROMPT.md](SYSTEM_PROMPT.md) into the model's system prompt, custom instruction, or agent role prompt.

Example request:

```text
风格路由：斗破热血
人物优先级：高
画幅比例：4:5
人物：一名黑衣少年，正面半身，右手托起青蓝异火
场景：远处沙漠城墙被火浪照亮
输出：标准结构化提示词
```

## Standard Output

The Skill normally returns:

1. `参数锁定`
2. `视觉导演方案`
3. `完整提示词`
4. `负面约束`
5. `可衍生方向`

Use `只要提示词` for a shorter response containing only the complete prompt and negative constraints.

## License

This project is released under the MIT License. See [LICENSE](LICENSE).
