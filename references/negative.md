# Negative constraints

Load this reference before writing final negative constraints or diagnosing failures. Keep positive prompt and negative constraints separate.

## Universal negative base

Use a compact version of this base unless the user asks for something incompatible:

`low quality, blurry, muddy colors, gray fog veil, overexposed highlights, crushed black shadows, flat lighting, bad anatomy, distorted face, unclear eyes, crossed eyes, asymmetrical eyes, melted facial features, waxy plastic skin, extra fingers, missing fingers, fused fingers, broken hands, twisted wrists, extra arms, duplicated body, duplicated character, merged people, wrong character identity, identity drift, face swap, outfit swap, messy costume, unreadable silhouette, random modern clothing, western armor, cyberpunk elements, sci-fi city, text, logo, watermark, signature, frame, UI, comic panel, low-resolution artifacts`

## Character-specific negatives

Add these when people matter:

- `face hidden by hair, face hidden by glow, face too small, back view when frontal face is required, expression unreadable, inconsistent hairstyle, inconsistent costume, reference mismatch, wrong eye color, wrong hair ornament, duplicated face, childlike proportions unless requested`
- For two people: `extra couple, duplicated partner, wrong gaze direction, no eye contact, broken hand-holding, fused hands, sleeves hiding joined hands, swapped outfits, merged bodies, incorrect spacing`
- For action: `motion blur over face, weapon fused with hand, fire covering eyes, energy source unclear, random energy direction`

## Route-specific negatives

### 逆仙黑暗

`cheerful cute mood, bright theme-park palace, global orange-gold cast, unreadable pure-black silhouette, horror gore focus, random skulls, excessive neon purple, modern weapons, sci-fi armor, generic Western dark fantasy`

### 斗破热血

`featureless fire blob, overexposed white flame, random energy everywhere, face hidden by flames, plastic armor, superhero suit, unreadable action blur, childish chibi proportions unless requested, no clear flame source, no cause-and-effect motion`

### 古风国漫通用

`plastic doll face, over-smoothed skin, generic mobile-game gloss, excessive petals, washed-out pastel haze, same-face characters, decorative clutter, copied palace template, emotionless mannequin pose`

## Structural negatives

Use when environment or giant scale matters:

`weak scale, tiny background only, flat foreground-background split, cluttered objects with no focal hierarchy, inconsistent perspective, fisheye distortion unless requested, buildings floating without visual logic, European castle, modern skyscraper grid, railing added by default, dense fog hiding architecture`

## Platform-neutral guidance

- Do not invent platform flags, sampler names, seeds, weight syntax, or reference-image syntax unless the user supplies them.
- For engines that support negative prompts, put the negative block directly in the negative field.
- For engines without a negative field, append a short `avoid:` paragraph after the positive prompt.
- Keep negatives specific to visible failure modes. Do not overstuff the negative prompt with contradictory style words.

## Negative audit

Before output, verify:

- Does the negative block include identity, face, hand, anatomy, and reference-image failures when people are present?
- Does it include interaction failures when two people interact?
- Does it include route-specific contamination?
- Does it avoid contradicting explicit user requirements?
- Is it separate from the positive prompt?
