<script lang="ts">
	import { browser, dev } from '$app/env';
	import { page } from '$app/stores';
	import ProviderModal from '$lib/ProviderModal.svelte';
	import Modal from 'svelte-simple-modal';
	import { connected, web3 } from 'svelte-web3';

	// we don't need any JS on this page, though we'll load
	// it in dev so that we get hot module replacement...
	export const hydrate = dev;

	// ...but if the client-side router is already loaded
	// (i.e. we came here from elsewhere in the app), use it
	export const router = browser;

	// since there's no dynamic data here, we can prerender
	// it so that it gets served as a static asset in prod
	export const prerender = true;
	let address: string;

	page.subscribe((o) => {
		address = o.params.address;
	});
</script>

<div class="content">
	<Modal show={$connected === true ? undefined : ProviderModal} />
	<h1>{address}</h1>

	<h2>Progress</h2>

	<h2>Contribute</h2>
	<p>Contribute tokens to the daosplit.</p>
	<h2>Rewards</h2>
	<p><b>total:</b> 100</p>
	<p><b>my rewards:</b> 300</p>
	<button>Claim</button>
</div>

<style>
	.content {
		width: 100%;
		max-width: var(--column-width);
		margin: var(--column-margin-top) auto 0 auto;
	}
	h2 {
		font-size: x-large;
	}
</style>
