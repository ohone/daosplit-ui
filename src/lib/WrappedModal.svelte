<script lang="ts">
	import Modal from 'svelte-simple-modal';
	import { connected, chainId } from 'svelte-web3';
	import { SupportedChains } from './SupportedChains';
	import ConnectModal from './ConnectModal.svelte';
	import SwitchChainModal from './SwitchChainModal.svelte';
</script>

<Modal show={$connected === true ? undefined : ConnectModal} />
{#if $connected === true}
	<Modal
		show={SupportedChains.some((o) => o.chainId === $chainId) ? undefined : SwitchChainModal}
	/>
{/if}
