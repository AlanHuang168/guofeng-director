# guofeng-director

`guofeng-director` is a rule-driven visual director Skill for Chinese guofeng donghua image prompts. It is adapted from the structure of `xianxia-visual-director`, but shifts the center of gravity from environment-first celestial scale to character-readable guofeng animation direction.

It is designed for:

- `逆仙黑暗`: cold, lonely, oppressive dark xianxia, high contrast, giant-scale pressure.
- `斗破热血`: youthful action, flame energy, combat momentum, explosive power.
- `古风国漫通用`: elegant guofeng fantasy, clear faces, luminous atmosphere, cinematic emotion.

## Relationship To xianxia-visual-director

This Skill keeps the original strengths of `xianxia-visual-director`:

- Required loading order.
- Explicit parameter lock.
- Route-based rule inheritance.
- Structured prompt output.
- Final audit before response.

The main changes are:

- Character clarity is promoted to a master rule.
- Front-facing or three-quarter front faces are supported by default when people matter.
- Reference-image consistency has its own rules.
- Two-person interaction is a first-class composition case.
- Figure size is controlled by `人物优先级` instead of defaulting to tiny scale markers.
- The same logic can be used as a Codex Skill or as a copied system prompt for other models.

## File Layout

```text
guofeng-director/
├── README.md
├── SKILL.md
├── SYSTEM_PROMPT.md
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

For Kimi, MiniMax, Seedance, Workbuddy, Catpaw, and Grok, copy the full content of `SYSTEM_PROMPT.md` into the model's system prompt, custom instruction, or agent role prompt.

Then send requests in this shape:

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

Use `只要提示词` for a shorter answer containing only the prompt and negative constraints.

## Open Source

This project is released under the MIT License. See `LICENSE` for details.

The repository intentionally contains only the Skill instructions and metadata needed for reuse. Local runtime files, generated outputs, caches, logs, and secrets are excluded by `.gitignore`.

## Publish To GitHub

After creating an empty GitHub repository, connect this local project and push:

```bash
git init -b main
git add .
git commit -m "Initial open-source release"
git remote add origin git@github.com:<your-org-or-user>/guofeng-director.git
git push -u origin main
```

If you prefer HTTPS:

```bash
git remote add origin https://github.com/<your-org-or-user>/guofeng-director.git
git push -u origin main
```
