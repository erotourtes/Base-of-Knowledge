---
title: "Svelte"
date: 2024-05-22T15:13:19+03:00
draft: true
tags: ["programming", "google", "javascript"]
math: true
---

# Svelte
```svelte
<script>
  let count = 0;

  function handleClick() {
    count += 1;
  }
</script>

<button on:click={handleClick}>
  Clicked {count} {count === 1 ? 'time' : 'times'}
</button>
```

```svelte
<p>{@html message}</p>
```

# Reactivity
## Reactive Declarations
```svelte
<script>
  let count = 0;
  $: doubled = count * 2;

  $: {
    console.log(`the count is ${count}`);
    console.log(`doubled is ${doubled}`);
  }

  $: if (count >= 10) {
    console.log(`count is dangerously high!`);
  }

  function handleClick() {
    count += 1;
  }
</script>

<p>{count} doubled is {doubled}</p>
```

Svelte rerenders on assignment, so the reactive declarations are reevaluated on each assignment to `count`.

# Logic

## Conditionals
```svelte
{#if ...}
{:else if ...}
{:else}
{/if}
```
## Loops
```svelte
{#each ... as name, index (key)} 
{/each}
```

By default Svelte removes the element

## Await blocks
```svelte
{#await promise}
  <p>...waiting</p>
{:then value}
  <p>The value is {value}</p>
{:catch error}
  <p style="color: red">{error.message}</p>
{/await}
```

## Events
```svelte
<script>
  const dispatch = createEventDispatcher();
  function handleClick() {
    console.log('clicked');
    dispatch('mymessage', {
      text: 'Hello!'
    });
  }
</script>
<button on:click={handleClick}>
  Clicked {count} {count === 1 ? 'time' : 'times'}
</button>
```

Event's is not propagated, so you need to use `createEventDispatcher` to dispatch events, or use helper on:message to propagate it


## Auto remove event listeners
```svelte
<script>
  let subsribed_count;
  const un = count.subscribe(value => {
    subsribed_count = value;
  });
  onDestroy(() => { un(); });

  // or 
  $count

</script>
