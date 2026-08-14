# guofeng-director

[中文文档](README.md) | English

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

Then embed them in this section:

```markdown
![Dark xianxia example](assets/demo/nixian-dark-example.png)
![Flame action example](assets/demo/battle-flame-example.png)
![General guofeng example](assets/demo/guofeng-romance-example.png)
```

## Layout

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

The repository intentionally contains only the Skill instructions and metadata needed for reuse. Local runtime files, generated outputs, caches, logs, and secrets are excluded by [.gitignore](.gitignore).
