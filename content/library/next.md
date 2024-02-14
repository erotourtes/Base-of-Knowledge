---
title: "Next"
date: 2024-01-17T14:47:41Z
draft: true
---


## Rendering
### Client-side
### Server-side
#### Static (at build time)
```ts
export async function getStaticProps() {
  const res = await fetch('https://.../posts') // by default, Next.js will cache the result => static compoenent
  const posts = await res.json()

  return { props: { posts, }, }
}
```
#### Dynamic (at request time)
```ts
export async function getDynamicProps() {
  const res = await fetch('https://.../posts', {
    cache: 'no-cache', // disable cache => dynamic component
  }) 
  const posts = await res.json()

  return { props: { posts, }, }
}
```

## Styling
### CSS modules
- style.module.css
- import styles from './style.module.css' -> receive a js object
### Tailwind CSS
### DaisyUI
[https://daisyui.com/](https://daisyui.com/)


## Routing
Based on the file system
```
- app
  - page.tsx -> represents the route
  - layout.tsx -> dictates the layout of the page
  - loading.tsx -> before component is rendered; works as wrapping children with Suspense
  - route.ts -> for api
  - not-found.tsx
  - error.tsx (or global-error.tsx for the root layout as well)
```

### Dynamic routes
- [https://nextjs.org/docs/routing/dynamic-routes](https://nextjs.org/docs/routing/dynamic-routes)
We can pass params []. Make it optinal and be array [[...slug]]
```ts
/*
  - [id]
    - [photoId]
      - page.tsx
*/

interface Props {
    params: {
        id: string
        photoId: string
    }
}
```

### Link
- Fetches only the elements necessary for the page
- Cache the page for faster navigation (clears on full page refresh)

### Async Components
- Suspense; streams data as it loads, so no bad impact as on CSR

### Api
Add `route.tsx` 
```ts
// without params would be cached
export function GET(req: NextRequest) {
   return NextResponse.json({
       name: "John Doe",
       email: "temp"
   })
}
```
