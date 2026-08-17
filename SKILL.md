---
name: guofeng-director
description: Generate, derive, optimize, and diagnose structured AI image prompts for Chinese guofeng donghua visuals, including dark xianxia / Renegade Immortal-like cold oppression, Battle Through the Heavens-like hot-blooded flame action, and general elegant guofeng animation. Use for character-forward ancient Chinese fantasy prompts, clear frontal faces, character consistency from reference images, two-person interactions such as hand-holding or eye contact, cinematic composition, lighting, palette, negative constraints, prompt rewrites, variants, or prompt audits across Codex, Claude, Grok, Kimi, MiniMax, Seedance, Workbuddy, Catpaw, and similar image-prompt workflows.
---

# Guofeng Director

Turn a short character or scene idea into a coherent, auditable guofeng donghua visual direction. Preserve character clarity and emotional intent while routing the scene through one controlled visual style.

## Loading policy

Load only the references a task needs. Do not read every file for every request.

**Always load (all modes):**

1. [references/master-rules.md](references/master-rules.md) — the controlling shared rule for create, derive, optimize, diagnose, variants, and direct-image tasks.
2. [references/style-routes.md](references/style-routes.md) — every task applies exactly one style route: `逆仙黑暗`, `斗破热血`, or `古风国漫通用`.

**Load on demand (only when the trigger applies):**

3. [references/character-rules.md](references/character-rules.md) — whenever any person, face, identity, reference image, costume, expression, pose, or two-person interaction is present or implied. Skip for environment-only scenes with no identity-critical figures.
4. [references/composition-light.md](references/composition-light.md) — whenever designing or changing ratio, camera, figure size, composition, palette, lighting, action, atmosphere, or cinematic rendering. A full structured prompt normally needs this; a pure wording-level optimize may not.
5. [references/negative.md](references/negative.md) — before writing final negative constraints or diagnosing failures. Any output that includes a `负面约束` block needs this.

For **diagnose** tasks, load the reference matching the reported symptom (e.g. identity drift → character-rules; muddy shadows or route contamination → composition-light and negative) rather than all four subsystem files.

## Operating modes

Infer one mode from the request:

- **Create**: Expand a short concept into a complete structured prompt.
- **Derive**: Retain character identity, style route, or visual DNA while changing setting, pose, mood, palette, lens, ratio, or action.
- **Optimize**: Rewrite an existing prompt for clearer hierarchy, role consistency, controllable camera, and model-friendly wording.
- **Diagnose**: Identify likely causes of unclear faces, identity drift, broken hands, weak interaction, dull lighting, clutter, weak scale, generic fantasy styling, or route mismatch, then provide a corrected prompt.
- **Variants**: Produce meaningfully different directions. Change at least two major modules per variant; do not merely swap adjectives.
- **Direct image**: Invoke an available image-generation capability only when the user explicitly asks to generate an image or directly output the picture. A bare parameter block means prompt generation, not image generation.

## Parameter lock

Record explicit inputs before directing the scene. Do not silently replace them.

- `画幅比例`: one of `16:9`, `21:9`, `4:3`, `3:2`, `4:5`, `9:16`; supplement `16:9` when omitted.
- `风格路由`: one of `逆仙黑暗`, `斗破热血`, `古风国漫通用`; infer from subject and emotional keywords when omitted, otherwise default to `古风国漫通用`.
- `人物优先级`: one of `高`, `中`, `低`; default to `中` when people are central, `低` when the request is environment-led.
- `参考图状态`: one of `无参考图`, `单人参考图`, `双人参考图`, `多参考图`; record which identity, costume, hairstyle, color, or prop each reference controls.
- `人物数量`: `0`, `1`, `2`, or `多人`; record role labels instead of vague group names.
- `人物可见性`: one of `正面清晰`, `三分之二正面`, `侧面`, `背影`, `剪影`; for `人物优先级：高`, default to `正面清晰` or `三分之二正面` unless the user explicitly asks otherwise.
- `人物占比`: infer from priority and ratio; see [references/character-rules.md](references/character-rules.md) for per-level frame-height ranges. For two people, record each person's readable scale and spacing.
- `互动关系`: one of `无`, `牵手`, `对视`, `并肩`, `护持`, `对峙`, `拥抱`, `交错动作`, or user-specified. If two people interact, lock hand contact, gaze line, body orientation, distance, and emotional direction.
- `镜头意图`: one of `角色正面`, `双人情绪`, `战斗爆发`, `巨物压迫`, `环境叙事`, `电影海报`; infer from the user's priority.
- `机位与镜头`: record camera height, viewing distance, tilt, focal length, depth of field, and whether faces are the focus. Never treat `大全景` as permission to make faces unreadable when `人物优先级` is high.
- `核心场景`: location or world premise.
- `主体角色`: identity, age band if relevant, facial temperament, hair, costume silhouette, signature prop, energy type, and expression.
- `主体景观/压力源`: palace, heavenly gate, battlefield, mountain, city, flame storm, calamity, moon, ancient tree, or other spatial carrier.
- `构图`: one dominant geometry, such as centered portrait, triangular two-person composition, diagonal action, framed vista, low-angle pressure, vertical ascent, or poster symmetry.
- `色彩`: palette, saturation area budget, contrast, neutral anchors, accent colors, and shadow color.
- `光线`: time, direction, hardness, color temperature, rim light, flare restraint, and face readability.
- `材质与特效`: fabric, hair, skin rendering, metal, jade, stone, flame, smoke, lightning, dust, blood, ink, water, clouds, particles, and energy effects.
- `负面重点`: identity drift, unclear face, extra fingers, broken hand contact, duplicated people, route contamination, overexposure, muddy shadows, or any user-specified exclusion.
- `输出模式`: standard, concise, variants, diagnosis, or direct image.

If defaults are needed, state them explicitly, such as `画幅比例：16:9（默认补充）`, `人物优先级：中（默认补充）`, and `风格路由：古风国漫通用（默认补充）`. If an unsupported enum value is supplied, state the conflict and choose the closest valid value only after naming the adjustment.

## Direction workflow

1. **Lock the scene promise.** Summarize the non-negotiable role, relationship, mood, route, ratio, and reference-image obligations.
2. **Apply shared master rules.** Preserve guofeng donghua identity, clear focal hierarchy, character readability, material credibility, motivated light, and positive/negative separation before applying a style route.
3. **Resolve character priority.** Decide whether the image is character-led, balanced, or environment-led. Set face size, camera distance, depth of field, expression, costume readability, and background complexity accordingly.
4. **Resolve reference consistency.** If references are present, bind each reference to one role, preserve identity anchors, and avoid transferring traits between characters. Do not invent unseen logos, text, or props from a reference.
5. **Resolve interaction.** For two people, build one readable relational action. Make eye lines, hand contact, shoulder angle, spacing, sleeve overlap, and emotional direction physically coherent.
6. **Select style route.** Apply exactly one route from [references/style-routes.md](references/style-routes.md). The route may intensify mood, color, action, or scale but may not weaken face clarity or identity consistency.
7. **Choose one spatial skeleton.** Use one dominant geometry from [references/composition-light.md](references/composition-light.md). Avoid competing perspective systems.
8. **Set camera and figure scale.** Use `人物优先级` to decide subject scale. Keep high-priority faces readable even in epic scenes; use background scale evidence instead of shrinking the characters automatically.
9. **Set focal hierarchy.** Assign dominant, supporting, and texture levels. The dominant may be a face pair, a single hero, an energy attack, a giant heavenly gate, or a cinematic environment, but only one hierarchy may lead.
10. **Design palette and lighting.** Apply the selected route's color grammar, then choose one motivated key light and face-readable fill. Separate dramatic shadow from muddy underexposure.
11. **Add material and effect evidence.** Describe costume structure, hair motion, cloth weight, skin highlight, flame or lightning behavior, smoke thickness, wetness, dust, debris, jade, metal, stone, and atmospheric depth selectively.
12. **Compose the final prompt.** Begin with ratio, camera, character priority, and route. Include reference-image instructions when applicable.
13. **Audit.** Run the master audit, character audit, route audit, and negative audit. Revise before output if any hard requirement fails.

## Style-route selection

Select exactly one route. Route triggers, hybrid handling, and the copyright/artist-imitation rule live in [references/style-routes.md](references/style-routes.md) (always loaded). For a hybrid request, name the primary route and add only one secondary accent without changing the locked route.

## Character priority

`人物优先级` controls figure scale and framing only — it never deletes route mood, composition, or cinematic light. Keep high-priority faces readable even in epic or environment-led scenes. Per-level framing and frame-height ranges live in [references/character-rules.md](references/character-rules.md).

## Platform compatibility

- Write platform-neutral prompts by default. Avoid unknown engine flags, sampler names, or proprietary syntax unless the user provides them.
- For Codex and Claude Skill use, follow this `SKILL.md` loading policy.
- For Kimi, MiniMax, Seedance, Workbuddy, Catpaw, and Grok, use `SYSTEM_PROMPT.md` as the full system prompt.
- For image models with reference images, use plain instructions such as `use reference image A for character 1 identity and costume; use reference image B for character 2 identity and costume` unless the platform has a known reference syntax supplied by the user.

## Standard output

Unless the user asks for another mode, return:

1. `参数锁定`: compact field list including exact or supplemented ratio, style route, character priority, reference-image status, character count, interaction, camera intent, camera height/lens, palette, light, and output mode.
2. `视觉导演方案`: short explanation of composition, character treatment, palette, light, action, scale, and atmosphere.
3. `完整提示词`: one copy-ready fenced `text` block.
4. `负面约束`: a separate fenced `text` block.
5. `可衍生方向`: three short variants that change at least two major modules each.

For `只要提示词` or concise mode, return only the complete prompt and negative constraints. For variants mode, give each variant its own complete prompt when requested; otherwise provide concise direction cards.

## Prompt construction requirements

The complete prompt must:

- Begin with `<ratio> 画幅，<camera/framing>，人物优先级：<高/中/低>，风格路由：<route>`.
- State which reference image controls which character when references are present.
- State face visibility, expression, gaze direction, hair, costume silhouette, and signature props for every important character.
- For two-person interaction, state the exact interaction, contact point, gaze line, body angle, spacing, and emotional relationship.
- Translate character priority into frame percentage, lens distance, background detail budget, and depth of field.
- State one dominant composition geometry and one focal hierarchy.
- Use route-specific palette, light, atmosphere, and effects from the selected references.
- Keep positive prompt and negative constraints separate.
- End with critical invariants and exclusions: clear face, stable identity, correct hands, no duplicated characters, coherent costume, no route mismatch, no muddy rendering.
