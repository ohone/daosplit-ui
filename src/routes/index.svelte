<script context="module" lang="ts">
	export const prerender = true;
</script>

<script lang="ts">
	import { goto } from '$app/navigation';
	import WrappedModal from '$lib/WrappedModal.svelte';

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
	<WrappedModal />

	<h2>or</h2>
	<button on:click={() => goto('/create')}>start new split</button>
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
