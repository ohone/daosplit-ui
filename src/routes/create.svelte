<script context="module">
	import { browser, dev } from '$app/env';
	import WrappedModal from '$lib/WrappedModal.svelte';
	import { SupportedChains } from '../lib/SupportedChains';
	// we don't need any JS on this page, though we'll load
	// it in dev so that we get hot module replacement...
	export const hydrate = dev;

	// ...but if the client-side router is already loaded
	// (i.e. we came here from elsewhere in the app), use it
	export const router = browser;

	// since there's no dynamic data here, we can prerender
	// it so that it gets served as a static asset in prod
	export const prerender = true;
</script>

<script lang="ts">
	export let targetToken: string | undefined = undefined;
</script>

<WrappedModal requiredChain={SupportedChains} />

<div class="content">
	<h1>create new split</h1>

	<p>Create a new token split. Enter the token you wish to target.</p>
	<input placeholder="token address" bind:value={targetToken} />
</div>

<style>
	.content {
		display: flex;
		flex-direction: column;
		width: 100%;
		align-items: center;
		justify-content: center;
		max-width: var(--column-width);
		margin: var(--column-margin-top) auto 0 auto;
	}
</style>
