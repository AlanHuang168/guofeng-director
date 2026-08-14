# Character and reference rules

Load this reference whenever people, portraits, named roles, reference images, faces, identity, costumes, poses, expressions, weapons, or interactions are present.

## Role locking

Before writing the prompt, assign each character a stable role label:

- `角色A`: identity or archetype, gender presentation if relevant, age band, face temperament, hairstyle, costume, color anchor, prop, energy type, and emotional state.
- `角色B`: same fields when present.
- `群像`: only use when the user truly requests more than two important characters. Otherwise keep background figures generic and subordinate.

Do not use vague wording such as `两个人` when role-specific identity, costume, gaze, or interaction matters.

## Reference-image binding

Use this binding format in `参数锁定` when references are present:

- `参考图A -> 角色A`: controls face identity, hairstyle, costume silhouette, main colors, and signature prop.
- `参考图B -> 角色B`: controls the second identity. Do not transfer traits between A and B.
- `参考图C -> 场景/道具/服装`: only when the user explicitly assigns it.

When platform syntax is unknown, use plain words in the prompt:

`use reference image A only for character A identity, face proportions, hairstyle, costume silhouette, and main colors; use reference image B only for character B identity and costume; preserve both identities, no face merging, no outfit swapping`

## Face readability

For high-priority people, include:

- Front or three-quarter front face angle.
- Clear eyes, brows, nose bridge, mouth, jawline, and cheek contour.
- Expression in one phrase: restrained grief, cold resolve, bright determination, startled softness, battle focus, gentle eye contact, or user-specified emotion.
- Lighting that preserves face planes: soft frontal fill, side rim plus readable fill, fire bounce, moon fill, or cloud-reflected fill.
- Hair arranged to frame the face rather than covering both eyes.

Avoid vague phrases such as `beautiful face` alone. Use visible anatomy and expression cues.

## Figure scale by priority

Use these as practical ranges, not rigid numbers:

- `人物优先级：高`: single person commonly 18–35% of frame height; two-person emotional scenes commonly 16–32% each; portrait or half-body may exceed this when requested. Keep environment as supporting pressure or atmosphere.
- `人物优先级：中`: full body or knees-up at 8–18%; two people 7–16% each; environment and character share the frame.
- `人物优先级：低`: 1–8%; use for scale-marker figures, lonely silhouettes, or environment-led giant scenes. Preserve identity only when references demand it.

If the user explicitly requests `大全景` and `人物优先级：高`, use a wide environmental portrait rather than shrinking faces beyond readability.

## Single-character direction

Specify:

- Face angle and gaze target.
- Body orientation and weight distribution.
- Hands: weapon grip, flame gesture, sleeve hold, seal casting, pendant touch, or relaxed pose.
- Costume silhouette: shoulder/collar, sleeves, belt, hem, cape or outer robe, ornament restraint.
- Motion: hair, sleeves, cape, flame, ash, lightning, dust, or water all follow one direction.
- Background relationship: character stands before, beneath, inside, or against the spatial carrier.

## Two-person direction

For two important people, specify:

- Composition: side-by-side, triangular, mirrored, staggered depth, protective overlap, opposing diagonals, or centered pair.
- Body orientation: both toward camera, one facing the other, one shielding the other, back-to-back, or crossing paths.
- Eye line: mutual gaze, one looking at camera and one at partner, both looking toward threat, or user-specified.
- Contact: exact hands, wrist hold, sleeve touch, shoulder support, weapon crossing, shared talisman, or no contact.
- Spacing: close, one step apart, separated by energy, divided by architecture, or connected across a threshold.
- Emotional relation: tenderness under pressure, restrained reunion, tragic farewell, battle trust, rivalry, or confrontation.

### Hand-holding gate

When `牵手` is requested, require all of the following:

1. State left/right or nearest/farthest hands if visually relevant.
2. Place the joined hands where they are visible, not hidden behind sleeves, glow, or bodies.
3. Keep each person with five fingers per visible hand and natural wrist alignment.
4. Let sleeves overlap around the contact without swallowing the hand shape.
5. Do not duplicate extra arms, mirrored hands, or fused fingers.

### Eye-contact gate

When `对视` is requested, require:

1. Both faces visible enough for gaze direction.
2. Eyes aligned toward each other unless one-sided longing is requested.
3. Background light or framing that draws attention between their faces.
4. No random camera stare that breaks the relationship.

## Costume consistency

- Keep one main costume color family per important character, with one accent and one material behavior.
- Do not overload a character with every guofeng accessory. Use two or three readable details: hair crown, jade pendant, belt ornament, sleeve embroidery, shoulder guard, flame mark, talisman cord, or sword tassel.
- Keep costume design coherent with route: dark frayed robes for `逆仙黑暗`, sharp youthful combat silhouette for `斗破热血`, elegant translucent layers for `古风国漫通用`.
- Preserve reference costume silhouette unless the user asks for a redesign.

## Expression library

Use restrained, animation-readable expressions:

- `冷峻压抑`: lowered brows, calm mouth, exhausted eyes, pale face light, controlled grief.
- `孤独逆天`: still face, direct gaze, wind-torn hair, slight blood mark, refusal rather than rage.
- `少年热血`: bright focused eyes, clenched jaw, lifted chin, fire-lit confidence.
- `爆发战斗`: narrowed eyes, open stance, precise hand seal or weapon grip, motion tension.
- `清丽仙气`: soft gaze, relaxed mouth, clear eyes, luminous skin, gentle breath.
- `双人情感`: one small asymmetry: tightened fingers, softened eyes, half-step closer, or sleeve caught by wind.

## Character audit

Revise before output if any answer is no:

- Are all important characters named as roles and visually distinct?
- Is each reference image bound to the correct role?
- Is face angle and expression explicit for every important person?
- Does figure scale match `人物优先级`?
- Are hands, weapons, sleeves, hair, and props physically coherent?
- For two-person interaction, are contact, gaze, body angle, spacing, and relationship explicit?
- Are costume details controlled rather than cluttered?
- Can the character remain recognizable if the background is changed?
