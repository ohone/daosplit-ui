<script lang="ts">
	import Modal from 'svelte-simple-modal';
	import { connected, chainId } from 'svelte-web3';
	import type { SupportedChain } from './SupportedChains';
	import ConnectModal from './ConnectModal.svelte';
	import SwitchChainModal from './SwitchChainModal.svelte';

	export let requiredChain: SupportedChain[] | undefined = undefined;
</script>

<Modal show={$connected === true ? undefined : ConnectModal} />
{#if requiredChain !== undefined && requiredChain.length > 0 && $connected === true}
	<Modal show={requiredChain.some((o) => o.chainId === $chainId) ? undefined : SwitchChainModal} />
{/if}
