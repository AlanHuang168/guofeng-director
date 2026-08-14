# Composition, camera, color, and light

Load this reference whenever designing or changing ratio, camera, figure size, composition, palette, lighting, action, atmosphere, or cinematic rendering.

## Aspect-ratio routes

Apply exactly one route:

- **16:9**: default cinematic landscape. Use for balanced character plus environment, battle scenes, ruined gates, and establishing shots. Keep faces readable when character priority is high; place characters near thirds or central lower half with environment pressure behind.
- **21:9**: panoramic spectacle. Use for long battlefields, desert cities, cloud seas, giant gates, and lateral pursuit. Keep high-priority characters large enough in a foreground or midground cluster; do not scatter them into tiny marks.
- **4:3**: classical tableau. Use for formal palace courts, symmetrical gates, intimate two-person scenes, or solemn portraits with architecture.
- **3:2**: photographic film still. Use for natural travel scenes, diagonal action, emotional character moments, and balanced cinematic shots.
- **4:5**: editorial poster. Use for front-facing characters, fashion-led costume clarity, vertical gates, flame power poses, and two-person emotional posters.
- **9:16**: immersive vertical. Use for mobile posters, tall heavenly gates, cliffs, flame columns, moonlit portraits, and vertical ascension. Stack face, body, energy, and environment without cropping important hands or heads.

Put the selected ratio in the first sentence of the complete prompt.

## Figure scale and camera

Choose camera behavior from `人物优先级`:

- `高`: close environmental portrait, half-body, knees-up, or full-body poster. Use 35–85mm equivalent for face stability; use 24–35mm only when the camera is far enough to avoid distorted faces. Use shallow-to-medium depth of field only if hands and interaction remain clear.
- `中`: full-body or environmental portrait. Use 35–70mm for balanced character and background; 24–35mm for wider action if faces remain readable.
- `低`: establishing shot, scale view, or environment-led frame. Use 24–50mm for depth or 70–100mm for compression and giant pressure.

Always record:

- camera height;
- viewing distance;
- tilt;
- focal length;
- depth of field;
- face readability strategy.

Do not use `wide shot`, `cinematic`, or `poster` as a substitute for specific camera placement.

## Spatial skeletons

Choose one dominant skeleton:

- **Centered character poster**: front-facing single character, symmetrical background, strong face focus.
- **Two-person triangle**: faces and joined hands or shared prop form a stable triangle.
- **Mirrored pair**: two characters face each other across a vertical light, gate, fire, moon, or sword line.
- **Staggered depth pair**: one character slightly forward, one behind, with readable emotional hierarchy.
- **Diagonal action**: weapon, flame, sleeve, or body motion drives from lower corner to upper opposite corner.
- **Low-angle pressure**: character readable in lower or middle frame while giant structure or calamity presses from above.
- **Framed vista**: doorway, eave, cliff, branch, smoke, or fabric frames a clear subject.
- **Vertical ascent**: bottom-to-top path through figure, stairs, gate, cliff, flame column, or moon.
- **S-curve journey**: path, river, cloud, fire trail, or robe motion leads through the scene.

Avoid multiple competing skeletons in one prompt.

## Character-background balance

- For high-priority characters, keep the background lower in contrast around faces and hands. Put the strongest edge or light behind the head, shoulder, weapon, or joined hands.
- For dark scenes, use rim light and soft fill to reveal face planes. `黑暗` means mood and contrast, not invisible anatomy.
- For flame scenes, let fire light the cheek, jaw, fingers, and costume edge without covering facial features.
- For romantic or quiet scenes, use environment lines to lead toward expressions rather than filling the frame with decorative petals.
- For giant-scale scenes, place scale evidence behind or around characters: off-frame gate, repeated stairs, giant columns, distant ruins, cloud layers, or city walls.

## Palette strategies

Use one base, one secondary family, and one accent:

- **Cold oppression**: blue-gray / ink black base, moon white secondary, blood red or violet lightning accent.
- **Flame breakthrough**: dark indigo or desert ochre base, golden orange secondary, cyan-blue flame core accent.
- **Elegant guofeng**: jade white or pale cyan base, mineral green / ivory / moon blue secondary, peach / gold / vermilion accent.
- **Tragic romance**: cold gray-blue base, pale skin and white fabric secondary, small red ribbon / blood mark / warm lantern accent.
- **Battle dusk**: smoky ochre base, dark bronze and black cloth secondary, hot fire and spark accent.

Keep saturation localized. Strong color should identify focus, energy, or emotion rather than coating the whole image.

## Lighting recipes

- **Cold moon and lightning**: cold key from above or side, lightning rim on hair and shoulder, faint face fill from cloud or snow, deep readable shadows.
- **Calamity backlight**: bright rupture behind gate or cloud, character edge glow, foreground remains detailed, one restrained flare.
- **Flame key**: flame source in hand or weapon lights face and fingers, warm highlights on cloth, cool shadows hold depth.
- **Desert fire dusk**: low sun plus fire bounce, dust catches orange light, distant city in blue-violet shadow.
- **Cloud-soft dawn**: broad soft key, pale gold rim, clean skin, visible costume texture, gentle atmospheric depth.
- **Moon-lantern split**: cool moon fill and warm lantern or talisman accent, suitable for emotional two-person scenes.

## Motion and effects

- State cause and direction: wind from left to right, flames spiraling upward from right hand, lightning falling behind, ash moving toward camera, sleeves trailing backward.
- Energy should affect nearby fabric, hair, dust, smoke, and light.
- Keep one primary effect and one or two secondary effects. Do not stack fire, lightning, petals, snow, smoke, water, and birds unless the user explicitly asks for chaos.
- Motion blur must not erase faces, hands, weapons, or the core interaction.

## Detail budget

Use detail where it matters:

- Face and hands: highest clarity when character priority is high.
- Costume: readable silhouette and selected ornament.
- Background: large shapes first, fine detail second.
- Effects: clear source and falloff.
- Atmosphere: layer separation, not full-frame veil.

## Composition-light audit

Revise before output if any answer is no:

- Is one supported ratio named and translated into composition?
- Is camera height, distance, tilt, lens, and depth of field explicit?
- Does figure scale match `人物优先级`?
- Is there one dominant spatial skeleton?
- Are faces and hands protected from over-effects, fog, crop, and motion blur?
- Does palette have a base, secondary color, and accent instead of uncontrolled color stacking?
- Is light motivated and route-consistent?
- Does atmosphere clarify depth?
