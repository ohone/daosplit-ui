<script context="module" lang="ts">
	export const prerender = true;
</script>

<script lang="ts">
	import { goto } from '$app/navigation';
	import { connected } from 'svelte-web3';
	import ProviderModal from '$lib/ProviderModal.svelte';
	import Modal from 'svelte-simple-modal';

	let splitAddress: string | undefined = undefined;
	const onKeyPress = (e: KeyboardEvent) => {
		if (e.key === 'Enter') goto('/split/' + splitAddress);
	};
</script>

<svelte:head>
	<title>Home</title>
</svelte:head>

<section>
	<h2>enter dao split address</h2>
	<input
		bind:value={splitAddress}
		class="addressInput"
		on:keypress={onKeyPress}
		on:submit={() => goto('/split/' + splitAddress)}
	/>
	<Modal show={$connected === true ? undefined : ProviderModal} />
</section>

<style>
	section {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		flex: 1;
	}

	.addressInput {
		width: 500px;
	}
</style>
